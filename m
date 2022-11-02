Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D9A617287
	for <lists+freedreno@lfdr.de>; Thu,  3 Nov 2022 00:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF3710E53A;
	Wed,  2 Nov 2022 23:26:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077B610E53A
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 23:26:25 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id b2so207931lfp.6
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 16:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4uyZR2sjXqLyFufMaC3oiMlnZtU+QLNchFZs2tyGbA0=;
 b=kOUNsLx5Y6YNxZXAKN99KHZEhCI9RUxJEK/3X6iMvn23FU+0cKFeOwijjRGO/QrEu7
 POwKgPGYxiHvdu1kXfirnmTS3yhpZ/nNh9/sXsntH50AqVSMgreKHQ0SYFrta4hE1UPP
 9yVZnn9s5lUnuZ/OdkhQZ6oe23jccwLSm8uSmpLMino6Oq0mQwSewujiQPFo7jutvlBb
 kaQ0GMfbN53yBLUD+MZALDhCeAMsgCY2e9Mlo/+Wsxtpf+vSqEdp291/h7YaMfX5mXJg
 e7yOY905/NPJHzDElm7R7qZGTNlA/8i3PqQqq9Gdzm+XY659wB862PHA8dNL1Vgyv0RW
 bI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4uyZR2sjXqLyFufMaC3oiMlnZtU+QLNchFZs2tyGbA0=;
 b=rWW1cTs2EV63ZtdK+8e/BoDnhdzfe9I1JWf5pei/O2l9xPWgUA/IbkhKa3ZiWa/imf
 fH9+DIEiuGRcjK5ffD5hkO4MaYLe5Q6j17M8KYMf4nOmB/C1wquTBLGF+bDOJjFzm86g
 MpqJC502CDdnV+eXI0zyIUgdP1kXBGeOEXl+0m/u8Eo4ejcBDCSPd2+cdMToP0AfgkJz
 XdCscsR+si4Z1dtePC7y4M5M+XymHrn3XOoerv28WQea4F0c8Te8KRH+ozfTfQ9RGfLy
 tqpLWXiJy22rIeCWBk6KaO9UmaiBbi8Mdiz48+72uw6TvJCQf8WQGkZS/AMnY13I9YXk
 G18A==
X-Gm-Message-State: ACrzQf2ijDpyukMoKEWjogPGzKBQKsoHOOEd1reG0AGG9YHN4cP98LYW
 SdvUh0ud05DxbvXR7P24Xc9vEA==
X-Google-Smtp-Source: AMsMyM7KyTnal/RdmTTT2p5aFTIEEqVQhf0y1ouH5tnV3OgPW/jxPwCYl85ji9r+213jZ0EzyBK+Uw==
X-Received: by 2002:a05:6512:40c:b0:4a0:5b27:76f0 with SMTP id
 u12-20020a056512040c00b004a05b2776f0mr10913392lfk.358.1667431581912; 
 Wed, 02 Nov 2022 16:26:21 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a056512048400b004a240eb0217sm2154391lfq.251.2022.11.02.16.26.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 16:26:21 -0700 (PDT)
Message-ID: <bf5fb954-c71b-f02f-5300-4e030b10811a@linaro.org>
Date: Thu, 3 Nov 2022 02:26:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20221101223319.165493-1-robdclark@gmail.com>
 <20221101223319.165493-3-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221101223319.165493-3-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 2/2] drm/msm: Hangcheck progress detection
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>,
 Chia-I Wu <olvaffe@gmail.com>, open list <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 02/11/2022 01:33, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> If the hangcheck timer expires, check if the fw's position in the
> cmdstream has advanced (changed) since last timer expiration, and
> allow it up to three additional "extensions" to it's alotted time.
> The intention is to continue to catch "shader stuck in a loop" type
> hangs quickly, but allow more time for things that are actually
> making forward progress.

Just out of curiosity: wouldn't position also change for a 'shader stuck 
in a loop'?


> Because we need to sample the CP state twice to detect if there has
> not been progress, this also cuts the the timer's duration in half.
> 
> v2: Fix typo (REG_A6XX_CP_CSQ_IB2_STAT), add comment
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>



-- 
With best wishes
Dmitry

