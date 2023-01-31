Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C305E682CF3
	for <lists+freedreno@lfdr.de>; Tue, 31 Jan 2023 13:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8165010E342;
	Tue, 31 Jan 2023 12:48:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D1110E369
 for <freedreno@lists.freedesktop.org>; Tue, 31 Jan 2023 12:48:55 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id v13so14255338eda.11
 for <freedreno@lists.freedesktop.org>; Tue, 31 Jan 2023 04:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pvlJDPmyZkse1KpRICBczG4DN3KDD75qIE0L61Q0oFc=;
 b=Cfc/3ngAO6dfmwbQA5rSsm6nSh72mkIVWEBN9auSqFMhKTjoQU1G1HzmlU9fZmT0OX
 98UDAOEsBRoZoFDn2VMSotWMnXzOXYO35WG7W8fCEcN5+Q4nRZSns+CHoLRauR/qelVY
 nquZ1x9YF6K2W1HxEoSQwDjc1gcfCkTPtAfYJQ2fu6DIXwbMsbbabNj91meNE6QVrIkX
 OxY+w9JOKFr5ykdIGTh1IaNqsVZg3Ov+SrvGzLU3qmesAZfErkWOE/d2cah8L7scwHI9
 04Wm/o00JgvAVNDMXvfrfyyxFC20mYGgw00Ck/z87Lh5RZ/JZB/OfMyYs/8u5cblRhcK
 TAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pvlJDPmyZkse1KpRICBczG4DN3KDD75qIE0L61Q0oFc=;
 b=5txSN2frCjtwPhaYpLokSWlGCpDMyJ/J++d9YZ1Xv41J9DT+XoHR495py4iCOENcEe
 DNycMTfzfqXkJbAB+3PPaKJ+hUk+anMzR5JEyhyALrB8jn3IX+JusUH4xvfCH8HeSO3f
 As5y4m1awtsu+DHnnljFcWJjce5MlETu87pOjPZR0T6JRrL+jeSmvK0gA7HgmHk5IV6K
 zoyy0lh0A/tITagBV+ck67ks4TWKTZ++vG7MVU/RQPraOkwVHZnrHX67ev7ul4wzq1OX
 G7yyUDUufb4/8b/cOF4Js4oLBdqaREtA9+iw6/4Uc8wNCVI1ojttwbgJGk76bgsVVCNz
 TdNw==
X-Gm-Message-State: AO0yUKWR3PzmYGgwsYprAE7dptY8GJThb4Be6CN3scUtpZcZQPoDJdnG
 jrTxkavDFC6dXch96orI8jA2IA==
X-Google-Smtp-Source: AK7set//VQXczvKXDG8kHylj7whbqt4shHHQk5vvtfw+X5QnesrfSqmHthhMT/zpwao7sG/SwmfnMg==
X-Received: by 2002:aa7:c755:0:b0:4a2:2e8a:14c0 with SMTP id
 c21-20020aa7c755000000b004a22e8a14c0mr14119954eds.9.1675169334447; 
 Tue, 31 Jan 2023 04:48:54 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a50fe83000000b004a26665b962sm1003272edt.89.2023.01.31.04.48.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 04:48:54 -0800 (PST)
Message-ID: <670d0a87-a932-6f33-b363-5499dc7ff29f@linaro.org>
Date: Tue, 31 Jan 2023 14:48:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1675091494-13988-1-git-send-email-quic_vpolimer@quicinc.com>
 <1675091494-13988-10-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1675091494-13988-10-git-send-email-quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v12 09/14] drm/msm/dp: disable
 self_refresh_aware after entering psr
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
Cc: quic_kalyant@quicinc.com, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dianders@chromium.org, quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, linux-kernel@vger.kernel.org, swboyd@chromium.org,
 robdclark@gmail.com, quic_khsieh@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 30/01/2023 17:11, Vinod Polimera wrote:
> From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> 
> Updated frames get queued if self_refresh_aware is set when the
> sink is in psr. To support bridge enable and avoid queuing of update
> frames, reset the self_refresh_aware state after entering psr.
> 
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_drm.c | 25 ++++++++++++++++++++++++-
>   1 file changed, 24 insertions(+), 1 deletion(-)

As I stated in v11's discussion, I do not like the way this change plays 
with the self_refresh_aware. Please find another way to work around the 
timing issue (let's probably continue the discussion back in v11).

-- 
With best wishes
Dmitry

