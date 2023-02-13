Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4876945F5
	for <lists+freedreno@lfdr.de>; Mon, 13 Feb 2023 13:36:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5F610E5A6;
	Mon, 13 Feb 2023 12:36:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 955C610E5A6
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 12:36:14 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id qb15so29410520ejc.1
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 04:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bd32m7OqwWmfxRntLTXoj2Vvtzxt3MPFU5fN2rFPKBw=;
 b=dvCbycvrc9yub29PKPvPP3eqtBOLpw9aDFAaq2QZ6jAz+qOmEtPSUP3OI3xPaFOrbR
 XC9skBpqQ6xT1N9hqfC4yfYQneJkCh/+jht/j55h6oMNYHYb863j5mw0Ovjwvb5UV9O5
 7W8ZGm0Q/HAsbGpBh3AApzpSjmq7boP2iipM4Vvz911C5PoGw97b+Pd6/6sI+QnSvDsf
 bALmWukNzp7u7+mQzEUvnGKgZ/t7B0BwBnhpoVWJmpRE590zzOvrEQX/BUXZon2KNcIo
 ZJ4xR6TChLGVl/+9Vm6Qspba3eRTMRUX83UKXvApK4Bpibd34XAt2jgL9oxFB3Iijole
 pDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bd32m7OqwWmfxRntLTXoj2Vvtzxt3MPFU5fN2rFPKBw=;
 b=CA3PZZsWTWY0ZurEmxe9lw4cMn2D8vbJboo9V0fdOAx4CMYmus87Jq0Ug4c/UmD+lG
 F4Cko92xBxV3cfeK7fh2rey7C8cOeTPt4biqs8V7V3L4MpnJ7MpdPftT1tiRXKUbBg9E
 jkPjV3QoAbSzL3lPGWBL//GwvIwECo/ZqteYrK7++Rukp8ZC0g7RNXzXBiVa46AgYl5i
 vjeOWnZs5O1dG6FqFsVDCZwSPzSP7vPJI45iUS6FwqW6KqV1Oo2bPEIkNOijcJNJAuFz
 KyukVbRld38cVBgohhe/Lv/lvsXEtIFy6JbqbW8EIUsDtL/nYdZbIRe7K4pfU1roKdya
 zI1w==
X-Gm-Message-State: AO0yUKU+q+jEGMSknoZF2S1ckVOWgT0o/qnYI3wy1Ik7J6/17wi4+ZJ9
 jSuHmKWEz5t0Q4azFHVm9dJFpQ==
X-Google-Smtp-Source: AK7set/aB/+3t2Nr+TF73Bn1Y7gchwJq4+GQRBW//hD8Z0srRwpeZdjF+wk4GzwU6/Z0x+oZHu5Vsw==
X-Received: by 2002:a17:907:3e23:b0:8af:2fa1:2226 with SMTP id
 hp35-20020a1709073e2300b008af2fa12226mr20533372ejc.6.1676291773137; 
 Mon, 13 Feb 2023 04:36:13 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 ot11-20020a170906cccb00b008775b8a5a5fsm6697679ejb.198.2023.02.13.04.36.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 04:36:12 -0800 (PST)
Message-ID: <4470ef7b-b94d-9e2a-d464-3cfb966bdee4@linaro.org>
Date: Mon, 13 Feb 2023 14:36:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
 <20230213121012.1768296-7-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230213121012.1768296-7-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 6/9] drm/msm/dsi: Switch the
 QCM2290-specific compatible to index autodetection
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
Cc: Vinod Koul <vkoul@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 13/02/2023 14:10, Konrad Dybcio wrote:
> Now that the logic can handle multiple sets of registers, move
> the QCM2290 to the common logic and mark it deprecated. This allows us
> to remove a couple of structs, saving some memory.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi.c     |  4 +++-
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c | 28 ++--------------------------
>   2 files changed, 5 insertions(+), 27 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

