# Статусы ответов {#api-status-codes}

Коды, приведенные в таблице ниже, соответсвуют кодам статуса протокола HTTP (HTTP Status Codes).

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{ll}
\textbf{Код} & \textbf{Описание} \\ \midrule

200 & Запрос успешно выполнен \\ \arrayrulecolor{light-gray}\hline
201 & Запрос на создание новой сущности успешно выполнен \\ \arrayrulecolor{light-gray}\hline
400 & В качестве значения параметра запроса переданы некорректные данные \\ \arrayrulecolor{light-gray}\hline
403 & Доступ запрещен (указан неправильный apiKey) \\ \arrayrulecolor{light-gray}

\bottomrule
\end{tabularx}