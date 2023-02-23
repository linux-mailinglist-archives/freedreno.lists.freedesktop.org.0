Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1EF6A0CF7
	for <lists+freedreno@lfdr.de>; Thu, 23 Feb 2023 16:32:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBB010EBD1;
	Thu, 23 Feb 2023 15:32:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2AF10EBD1
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 15:32:38 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id h9so11092213ljq.2
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 07:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LRKRWprEZuD2eBwpUD29JzKZTLuOFVMqqL7Lx+nXuUU=;
 b=eh/ODz/HpObGw9DUdcihpcqQXSZ4JBk2sakl4v/kqlyd1dr9ykX5wA0w4TXymNXNJK
 lfF0J7bNo8oCwheZreU64j17DMviDkqjBL3W61vHHWGqYy/qkfHatCOVqEEkodUh/Jsf
 GsTQFpHlZTyI/0+aZq5GQXlNo/u+T4aU6c4ZsgQrgXz0P37ca+VCRSA/jpRFCwyhctXI
 jNL4WNPP5NP/OP0WCE7PeLvQ7za+A0VX5vT9gfXBkfhkM6KAwHKoBNT9875lTFiV2MJt
 bQljsRSW5ed3ORe2gbLNFemzYwZeYGioMzDp7k8guN8UsAlq0LBsl2eYBhEaHtbE0neZ
 drqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LRKRWprEZuD2eBwpUD29JzKZTLuOFVMqqL7Lx+nXuUU=;
 b=XTg9j9PhtwGhjXPrqmBNxo7J4cSrSTerFnLDyHky2a+Z+fxp6TH6Ugdi81btRll+u1
 mU7WPiOtn16JDeHFqSVFCnIKLqKbpXW47m5jVFj/Y19A2koXgErubjWnx2gWm9GqXXqD
 MELahqxI13IQaKBZt8FAoh7HQ+3ING7puJa+fI6AzjYTxAC4dYHuAkU6gv7Jf1fAe7nl
 AhxBrkEczDTeEWh95dhPrUt18AmgaTxF1WH15pD4Z5OU8I6RKRx/jvM7sl1fOSXePOQy
 Ez4ZfA/csVD6uI1kO/d1kAGchPmtru/SKl5pmPNdeHp2AigMjtapxYooj1+W2VfkYrww
 V+uQ==
X-Gm-Message-State: AO0yUKWi37Qfr2ntU0ijC2GPavatf6ug6E/lTYeEV72jfLScT91DhXx4
 PgEz5R5d73IYxHMT+j0UuSlHvQ==
X-Google-Smtp-Source: AK7set+gDpYSnmThwzayYEy7qKRW50AOGBJZpkb3kJM+3R0C2IYIfKQw4BstjGsuW05TEGxOJzPYYg==
X-Received: by 2002:a05:651c:204a:b0:293:4ff1:5936 with SMTP id
 t10-20020a05651c204a00b002934ff15936mr3865262ljo.47.1677166356725; 
 Thu, 23 Feb 2023 07:32:36 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a05651c030d00b002906c22d6f1sm1045866ljp.18.2023.02.23.07.32.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 07:32:35 -0800 (PST)
Message-ID: <365754f1-757e-a997-a734-19e79550c63b@linaro.org>
Date: Thu, 23 Feb 2023 17:32:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230223-topic-opp-v3-0-5f22163cd1df@linaro.org>
 <20230223-topic-opp-v3-1-5f22163cd1df@linaro.org>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230223-topic-opp-v3-1-5f22163cd1df@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 1/7] drm/msm/a2xx: Include perf counter
 reg values in XML
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 23/02/2023 12:51, Konrad Dybcio wrote:
> This is a partial merge of [1], subject to be dropped if a header
> update is executed.
> 
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/21480/
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a2xx.xml.h | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

