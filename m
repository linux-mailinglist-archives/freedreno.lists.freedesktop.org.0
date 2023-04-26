Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 483BE6EEB2B
	for <lists+freedreno@lfdr.de>; Wed, 26 Apr 2023 02:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68CE610E826;
	Wed, 26 Apr 2023 00:01:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D8110E826
 for <freedreno@lists.freedesktop.org>; Wed, 26 Apr 2023 00:01:39 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-50847469a7fso9422319a12.0
 for <freedreno@lists.freedesktop.org>; Tue, 25 Apr 2023 17:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682467297; x=1685059297;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yTdc9DJ14HbNnnfxarhYVsLnqLsfg9vMdDLB5FChyxE=;
 b=T2u6R7p0/3Naz9CpQHHIiQlXKSa/8shAFvj+JmuSUz71hjyl/B7wfyjWpKY2MSwt9X
 kxiSDY2DP8qtEX0Yr4FIsYI2hg7SSG7pTRcabKuDw80MFxmROsrTI++g1HtIGdhFzmID
 vV+CyugLT6r83uuMVEXW1xXRZqH+T9Wkm1WSrxGD5YEIhPe0nETPbDe1fy8Kt83zxaa+
 q/vJVVVrSwfux57up5piUclqlR84rIcI5jwSpigbe5uK1sYaZLNbRQ3UUxoJP4iZUv1H
 ICuzx0Fk90LCu7cjfqcqSSJXvCxy7j3Fzn070mx6aJRI4ndd8TQO64D0zX7Gui2YHRlf
 s23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682467297; x=1685059297;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yTdc9DJ14HbNnnfxarhYVsLnqLsfg9vMdDLB5FChyxE=;
 b=B5UGuQTcGWRuvf1BHDtZ3vHvbTVZuhU11mromK5lOdx18AseuyYs2BZlDl0zhxIlBZ
 cu5xz5YYIDEBQBqrkw1ay1nyvNHwCgdon+oHhur9314n5DHYeBnpgbamtagw/wbdis5o
 kpGKYUcS0+eWgzzwdZ08pbmWbyS1D0klVsy+S5qhfp0CxpoXh01jJy5H/uxmLYmIt2Oe
 nbERP0Ve2SzLVWcxRFs0VA5wXCOq4Gt0DtGgqgj7cDlMANh9Hw3T3pJJJgXjcPhOGwf+
 SgtY7qDh6J5B4Qbjy6ikK6IieUdyKx+ufLCo2i1o5Ymol5YpwiuLiljSw/D7drCXO7Ht
 TVTA==
X-Gm-Message-State: AAQBX9dt1yw7OtNsRdrnGKg+ffErS51thLwxV/FiHqmIjOFyBJStSJnA
 kb36yuFIhs8PLLE3tydafJG/lQ==
X-Google-Smtp-Source: AKy350Yi+SP1ungFzVgkmrReJnEHkZSbkfMXXsoAkLVpKsdFjozoiLrSA2Mv5lSGeMBCu/kUCxwNeQ==
X-Received: by 2002:a17:907:8b87:b0:94f:21f3:b5f8 with SMTP id
 tb7-20020a1709078b8700b0094f21f3b5f8mr14879847ejc.21.1682467296852; 
 Tue, 25 Apr 2023 17:01:36 -0700 (PDT)
Received: from [172.23.2.4] ([31.221.30.162]) by smtp.gmail.com with ESMTPSA id
 op4-20020a170906bce400b0094f39379230sm7381550ejb.163.2023.04.25.17.01.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 17:01:36 -0700 (PDT)
Message-ID: <41d74c67-3d66-a363-f888-ee7763c76495@linaro.org>
Date: Wed, 26 Apr 2023 03:01:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Adam Skladowski <a39.skl@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
References: <20230411-dpu-intf-te-v3-0-693b17fe6500@somainline.org>
 <20230411-dpu-intf-te-v3-4-693b17fe6500@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v3-4-693b17fe6500@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 04/21] drm/msm/dpu: Reindent REV_7xxx
 interrupt masks with tabs
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
Cc: Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 26/04/2023 02:05, Marijn Suijten wrote:
> Use tabs for consistency with the other interrupt register definitions,
> rather than spaces.
> 
> Fixes: ed6154a136e4 ("drm/msm/disp/dpu1: add intf offsets for SC7280 target")
> Fixes: 89688e2119b2 ("drm/msm/dpu: Add more of the INTF interrupt regions")
> Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

