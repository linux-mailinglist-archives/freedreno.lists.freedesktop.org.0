Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 827396E869F
	for <lists+freedreno@lfdr.de>; Thu, 20 Apr 2023 02:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A30610E65F;
	Thu, 20 Apr 2023 00:34:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC8010E65F
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 00:34:49 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id h4so986152ljb.2
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 17:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681950888; x=1684542888;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SiD2IbSXDlZieZbHjHSUCYuY9cMoYEC6NH0/3B6dQu8=;
 b=O+lCT+vKd5Oa5GiRbxw7qL8wkuSG00ORMMDBlLOwsPgT/jhrHekej/EItt7u9FaeT1
 d/yx5FefelzVb3CAYwoW/XSy5fhpjns+UN9N8OuVRkdpfUxBXFTWhN55CaFiPVIP4THf
 sAOV+BnefWKLauLviLr9u+yeYkKoMM+groigIxvyiNGQYevkGSKLZqClA5AurBNQd+zD
 vlGz6UUqk0sP0dr4ubWoyJWIleyQpiJr1UcdzQ/tmwGQZUzQMSiRwe6d9ta8+7NIm15n
 A4mFpDJWkolxId1eqdrfdgtb5yI0RrlH7hXc3s726PXkzOIttC1E5Mhhc9PxQxocB1zf
 Lawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681950888; x=1684542888;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SiD2IbSXDlZieZbHjHSUCYuY9cMoYEC6NH0/3B6dQu8=;
 b=H//JEqegOQfb+QKBjIyv/7tnpz5SQ51/Uo9lWGniSkpmzbbLwNyjmXYniwRl1cvgvj
 3moCUFiOrFkUtejHUimwo2Y6m2ldrnrRwfGWr0G11x2/3p1yGp3RDicAijfe2djlrTnv
 +sXLxxyYZw1cF9UKdSwLHTgC5cI6JZht3hRjPUU3iOvBvvtNUTxyC1OzEuNX9JtWh5hj
 WrW3SuwKO7MmaBFYtN4KjqFfN/Z7Yc7tXPDkeHH/Yi5TxDsSuFKtwdQsnFMAsvGShIKb
 /oXBvmNk5L9GWfrIO/wnNSEggkFVp/rr7y0DCQY0wTr7src5ARGcIo6vmTlj6GfvL82B
 ws0w==
X-Gm-Message-State: AAQBX9csIDkkJMhRKrrNutLrxheOqsily1lLi78o+4DysDtE57t0cmiC
 BfL09boqR9s//fhlPU+M333jpw==
X-Google-Smtp-Source: AKy350YvIZfOnGNH4KiFjQVFRnlA3Yfawn3xwcpbRrpe+vuboDSOq1oyRB6ko/rWn8vrrq6E6cVPTQ==
X-Received: by 2002:a2e:9f44:0:b0:2a8:a07a:a46d with SMTP id
 v4-20020a2e9f44000000b002a8a07aa46dmr2286782ljk.33.1681950888099; 
 Wed, 19 Apr 2023 17:34:48 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a2e9b0c000000b002a8b205bb50sm11977lji.61.2023.04.19.17.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 17:34:47 -0700 (PDT)
Message-ID: <6f8eab89-c04d-9144-9aa9-3566c0abac77@linaro.org>
Date: Thu, 20 Apr 2023 03:34:46 +0300
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
 Vinod Koul <vkoul@kernel.org>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-1-ef76c877eb97@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-1-ef76c877eb97@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 01/17] drm/msm/dpu: Remove unused INTF0
 interrupt mask from SM6115/QCM2290
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 17/04/2023 23:21, Marijn Suijten wrote:
> Neither of these SoCs has INTF0, they only have a DSI interface on index
> 1.  Stop enabling an interrupt that can't fire.
> 
> Fixes: 3581b7062cec ("drm/msm/disp/dpu1: add support for display on SM6115")
> Fixes: 5334087ee743 ("drm/msm: add support for QCM2290 MDSS")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
>   2 files changed, 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

