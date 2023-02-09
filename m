Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA25C69109F
	for <lists+freedreno@lfdr.de>; Thu,  9 Feb 2023 19:48:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB6410EB63;
	Thu,  9 Feb 2023 18:48:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0746D10EB63
 for <freedreno@lists.freedesktop.org>; Thu,  9 Feb 2023 18:48:09 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id ud5so9267539ejc.4
 for <freedreno@lists.freedesktop.org>; Thu, 09 Feb 2023 10:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C0XFAAN/R3Nk3WTCxVWqIYm+jEES9opCixMqEiVuViY=;
 b=pUGPWsmzseTiUdXm5Gq5C3eb2NwodF8g8zjRmRTiE7I/5aPZbtQUcYbzWCMFGxDoBf
 bW/uqtss3/h+HTZLyKkgMSMIUJVo6Dv6YAjlisoTh92WIfb8U2pCQbk+pv27kg8WMwuc
 QzAahiEQM7+E3qehrq7vSGtBSOjMvWzjNEZMFbvjZwN5ULMTA9P/IH8Iqf1B5mHAGZvH
 RdIZCHwY/E8Mp2LGeKIJWg5TeixFYr0sHRkG9qG73xlqeImTn/agcE/b6LkeFCja85sp
 LBJcPDXUrVsbSYzZt1Xo3DGs6oVZSmgA2iNfzYh/uPbkCmY86JXSGN1mH0MBqhjqvFGN
 1nXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C0XFAAN/R3Nk3WTCxVWqIYm+jEES9opCixMqEiVuViY=;
 b=jCgPX7IrVsoJIk8nBaNGxsw0ibQK2En20NoSQrg/MjwubPCnCgtP3Z6BddgBxYRoGx
 kTfFwz6VNov3iTNWVK2V85QZV8/hfyWv93ksaBGWuSdHef2Goyi95GLNXMTkqb3KQpWF
 RHq/AskYxBMcyuJQZH1+8c/1s9lPsfZ6mGRU0jGsfG9wOyg19ObRYoKjg/AdDcGsaw0k
 3zbxKb7hdKKqliDqMgJV9oN1u4TNMhceJIWoMHTsJqUoZidHzDwGulrks3W02QwSHj60
 kjqmvTs2sN881PmIG7UxYi/MrspXtQFDgL1R745TnJ9E/n6uthzV8XdRIO1WPRwvld92
 +BsQ==
X-Gm-Message-State: AO0yUKVkRZacOgIPBJhVa9c3LuGy0g5BP+ODVWRqA40xTBARj1WWmSP1
 /JxWdiuHoS6Z/Bq61o1dD0aQMw==
X-Google-Smtp-Source: AK7set+qkUjZFmf6QQRtEvHs5uIs2uEFZ0sHmBfO82Y5zz2lrkZQXi+23m9SAyU302Gu3nVmrstadA==
X-Received: by 2002:a17:906:b142:b0:7bd:43e9:d3ab with SMTP id
 bt2-20020a170906b14200b007bd43e9d3abmr14772263ejb.52.1675968488402; 
 Thu, 09 Feb 2023 10:48:08 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a509993000000b004aad231b316sm1144383edb.40.2023.02.09.10.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 10:48:08 -0800 (PST)
Message-ID: <e4c48c3c-b3cc-7760-83a9-7af6eb74bf2a@linaro.org>
Date: Thu, 9 Feb 2023 20:48:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230209184426.4437-1-quic_jesszhan@quicinc.com>
 <20230209184426.4437-3-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230209184426.4437-3-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH v2 2/4] drm/msm: Check for NULL before
 calling prepare_commit()
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 seanpaul@chromium.org, marijn.suijten@somainline.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 09/02/2023 20:44, Jessica Zhang wrote:
> Add a NULL check before calling prepare_commit() in
> msm_atomic_commit_tail()
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

