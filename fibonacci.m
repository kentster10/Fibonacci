classdef fibonacci < handle
    
    properties
        Fib = [1 1]; % first 2 values in fibonacci sequence
        answer_num = [];
    end
    
    
    properties (Constant)
        numLines = 1; % used for user input GUI
        defaultInput = {'3'}; % used for user input GUI
    end
    
    methods
        function obj = fibonacci()
            
        end  
        
        function main(obj)
            obj.answer_num = fibonacci.user_input;
            if isnan(str2double(obj.answer_num))
                display('input must be an integer, please try again')
            elseif str2double(obj.answer_num) < 3
                display('input value must be greater than or equal to 3')
            else
                for i = 1:str2double(obj.answer_num)
                    if i>2
                        obj.Fib(i) = obj.Fib(i-1) + obj.Fib(i-2);
                    end
                    
                    if mod(obj.Fib(i),3)==0
                        display('Buzz')
                    elseif mod(obj.Fib(i),5)==0
                        display('Fizz')
                    elseif isprime(obj.Fib(i))
                        display('BuzzFizz')
                    else
                        display(sprintf('%d', obj.Fib(i)))
                    end
                end
            end
        end
        
        
    end
    
    methods (Static)
        function answer_num = user_input()
                prompt = {'Enter Number of Points [N >= 3]:'};
                dlg_title = 'Input';
                num_lines = fibonacci.numLines;
                defaultans = fibonacci.defaultInput;
                answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
                
                answer_num = cell2mat(answer);
        end
        
        
        %Unit Test
        fibonacci_Test()
        
    end
end