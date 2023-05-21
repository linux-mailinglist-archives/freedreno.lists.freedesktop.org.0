Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A5C70ABBD
	for <lists+freedreno@lfdr.de>; Sun, 21 May 2023 02:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D754F10E1A6;
	Sun, 21 May 2023 00:05:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F9E10E083
 for <freedreno@lists.freedesktop.org>; Sun, 21 May 2023 00:05:14 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2af225e5b4bso26830781fa.3
 for <freedreno@lists.freedesktop.org>; Sat, 20 May 2023 17:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684627512; x=1687219512;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MT2O6oEN4amZYZbrPzoTSJIieP6gKCVAv+FAOIlFDXo=;
 b=XFBqKEra1c/S26nfesjWt8E3n4da7Md83Qiisn1UfjHJJkHSilc1MK4xgcu1Mmtn1z
 Ol+T86Oh+5cGxlezT7q7sp3KXGfDtqljAUaZVTCTc1IV0oicq6iZBDy7Pk77gMp2Y5tY
 0Ua/vlANdFKNbAUESeGGgwSOuWy7z42omTf7hJYcbo2RhcdhfBEz99rsB8Kt43JydXYc
 nrVrrbaTKpOhGyCe1+Fvfkliy7fQxUbi4ZNMXv0CqHeqFDAKHV6J6+vlMe/sJ9mkNXE0
 GdtHgQ/52xgOehvnXkBRw1O+qd1kj5gmOREAtIVI419LBTIfpmQN6F71y5CGXwPsVsgM
 p3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684627512; x=1687219512;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MT2O6oEN4amZYZbrPzoTSJIieP6gKCVAv+FAOIlFDXo=;
 b=TVmQBLejiCOHybdAD+zwQbWAvHAo+SIrhTpSvHfdApQOwuxCbB6xcYAA4pua9023mh
 aeibiO/i6F6EY1gVWt8Kqmvhp+hNm6Lm0+QaVlF5XQmJXzZGGMTlox1Z27/zsM9DsxFx
 KTa10GUYcsl5NocXc6O98cZxkSd1vzaBbZ8Jz5powr6xBm98EQkz3+wfRm3JnSgqRiTs
 5jB0k3KP2z0vta0lzwFcWOiXIIixp4n8GlG5SC2ZE+2GoHRzwZ8zxNdwm0ID0OBQO3py
 9PRv8pagYstZE60Yqi96X20GpRmSqr/jQV/9Kh8xm6ftPM2zJKD1D+iaszjk4GJOJ+lb
 grTA==
X-Gm-Message-State: AC+VfDxF1SzEEWc8js0KRj9o4y2NFW9awBHjcI6MuWmTeawX6klfMLs4
 bpAQcVr0DueyD4IctELzlpSU0g==
X-Google-Smtp-Source: ACHHUZ4jgVMNNvFJMhZdrVgAOcV35Yjx3chgNSXtiIxkETrAzXdaeq+4jbf5BxLmtDKv30mLNW2NFw==
X-Received: by 2002:a2e:3c0d:0:b0:2ac:826e:c5a with SMTP id
 j13-20020a2e3c0d000000b002ac826e0c5amr2828206lja.1.1684627512687; 
 Sat, 20 May 2023 17:05:12 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a2e9a81000000b002ad90280503sm488438lji.138.2023.05.20.17.05.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 May 2023 17:05:12 -0700 (PDT)
Message-ID: <828b2591-c160-b88c-bc8f-5105fffe23d3@linaro.org>
Date: Sun, 21 May 2023 03:05:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1684452816-27848-1-git-send-email-quic_khsieh@quicinc.com>
 <1684452816-27848-7-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1684452816-27848-7-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v11 6/9] drm/msm/dpu: always clear every
 individual pending flush mask
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 19/05/2023 02:33, Kuogee Hsieh wrote:
> There are two tiers of pending flush control, main controller and
> individual hardware block. Currently only the main controller of
> flush mask is reset to 0 but leave out some individual pending flush
> mask of particular hardware block keep previous value at
> clear_pending_flush(). Reset all individual hardware blocks flush
> mask to 0 to avoid individual hardware block be triggered accidentally.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

