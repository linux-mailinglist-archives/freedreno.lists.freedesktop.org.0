Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 758BF7D89F0
	for <lists+freedreno@lfdr.de>; Thu, 26 Oct 2023 23:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154A510E8AC;
	Thu, 26 Oct 2023 21:00:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E26210E8A5
 for <freedreno@lists.freedesktop.org>; Thu, 26 Oct 2023 21:00:48 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-32db188e254so923969f8f.0
 for <freedreno@lists.freedesktop.org>; Thu, 26 Oct 2023 14:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698354047; x=1698958847; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z0mjma84WMq9b/LapGl0vTYYJiWs1xZ6cRV2SXhERRk=;
 b=Fm9p4+ENldoCBdmPrjCo1lBT1T11Pp94PedyoyFp/53nS4AaZSkm/ZRn2ldj5paBGc
 lPPD95O2QijqTe9xHKrvkrMNDx9B9h8zDKvaATti9x8jqYE33fPcegNRV933qxsgrnFz
 dFjtPLA8OX0Ck0Pz1Ck/3ySk7JX6Ti//h4dRx40WrDrYcPB/8JosW3bgcWbhYcpBKJ1Q
 9ou6fv+Rm0pf3w1YV8YuKr0giLjDC+gZSdcVAlbOxCvtVzQUuEsOR+o/YHduRZjDiid/
 1THJmJ15umc4h/OBxMci3kUBVpfw7RVKIv1ZgmRw0hlMKpJgI+UyPaLLY9EkLk7vyg9c
 TjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698354047; x=1698958847;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z0mjma84WMq9b/LapGl0vTYYJiWs1xZ6cRV2SXhERRk=;
 b=PEpUi6a6AF4/DA3uNI7UWak9OnGKg1z+6P3tsGydCvDdhqbgOw3K1ryUvQ9M6mMtfG
 xlvvP7+UAK9+1JRu0WN6RVPnQYqbyq6uF5qRtopXGJrJFb/EQPKUmmbooUMGSptRnX7R
 NtBcdCHUXsMwbO4QFodBHuiYgSDGpTiOd/Of2RU6a+WjhHIzReaOs7nGCKRqW8qpscvQ
 LOz4iaaW74WVJiJ1J3aCpi6ob4Kyjv8j312B8BFkzldAA/YLg2WKD20WpSSbFbpoIH1B
 wlb/gCp7rJpFIPmUeYwvmmF8Ui8QbHGNb7Q098jXz0GlHFe9vul1dPJVYuk2RwMYPVcb
 FWmQ==
X-Gm-Message-State: AOJu0YxA/wCrGdXCrJWZGX5Gg5aRDXKQoqRPM4Ui1nZ/vKKfHuf3oW7/
 7OBT0mcDEmSDkoSJVEb2LmU3YA==
X-Google-Smtp-Source: AGHT+IEfhhLYylIduYkXq6MRvxYQEjqp5ZqhMAToFXaZMFHGlqgOi/vTtnPKL+amQAp6vTiD/WTufA==
X-Received: by 2002:adf:fc49:0:b0:32d:be57:795f with SMTP id
 e9-20020adffc49000000b0032dbe57795fmr545587wrs.6.1698354046861; 
 Thu, 26 Oct 2023 14:00:46 -0700 (PDT)
Received: from [172.30.205.55] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 l12-20020adfe9cc000000b0032dba85ea1bsm235247wrn.75.2023.10.26.14.00.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 14:00:46 -0700 (PDT)
Message-ID: <b779b911-dff3-420c-9bf9-5b7bef24337c@linaro.org>
Date: Thu, 26 Oct 2023 23:00:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
 <20230928111630.1217419-16-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230928111630.1217419-16-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 15/15] drm/msm/hdmi: drop old HDMI PHY
 code
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
Cc: freedreno@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-phy@lists.infradead.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 9/28/23 13:16, Dmitry Baryshkov wrote:
> Drop source files used by old HDMI PHY and HDMI PLL drivers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi_phy.c      | 216 -------
>   drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c |  51 --
>   drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 765 -----------------------
>   drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c | 141 -----
>   drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c |  44 --
>   drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 458 --------------
>   6 files changed, 1675 deletions(-)
>   delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy.c
>   delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c
>   delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
Uh-oh, is the 8996 HDMI phy accounted for somwhere else?

Konrad
