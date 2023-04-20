Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC61E6E8739
	for <lists+freedreno@lfdr.de>; Thu, 20 Apr 2023 03:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A968010E768;
	Thu, 20 Apr 2023 01:11:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BCE510E768
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 01:11:33 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2a776fb84a3so1954771fa.1
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 18:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681953091; x=1684545091;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IJrj+TgMbRzpuRXJE5LfWMJR9AP3X9yDCnaEAQl9U/8=;
 b=V+8QqEVBeITyrDt7Ielo1BpAwLg5mjgUup+tt26oPAfDBML3it68PcVK9kL9FRn0sU
 aWWaMZc/I6R9tIjnnpp4LFv71i1PfY88ldyTSkPaCoSaBk3pSnsYp0MAh/3+meuMsJSC
 dxO1jkG5XH9QfqUJaIunJMn9teZZTAzegWjswwvvJISYHWoKI9RDvA9DZxy4j/7N7WQ8
 nAXCN4tyR7S+9vGszC348dvW9uhRoAwbPdGKV2m2omHyhz/TOxqSz/+hmTUqu3iBtXbf
 r6kHG8tCybkBXZnoKrY8ZSorCdVsdybrg9W7ouJTfGNhpzGHqSzoBgJ35h4ZqWoqTeym
 PCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681953091; x=1684545091;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IJrj+TgMbRzpuRXJE5LfWMJR9AP3X9yDCnaEAQl9U/8=;
 b=QQAab8Rq/DiOHsuAyOpfNq9HoyBTLA2JRMJZUD8Odh3x6FQ9SgL0eagyEZcoJswE/n
 PLgVVwOAwksmwOsn+QnyOP0WOa9+SpMLrWqfhyxx0Whe4PsjevVWdUHQVABX2Ehg2tIE
 XxOOB3U+oX7qZztxFRsRksD1uVjmKPL0IB92AkPW/LmLqYtl4Tr4XYHIOIL98OG99ZpM
 7B5KZFFdZyLOEGFyKueiim9XLkB4vwL/+pk+NyGQpiiilhJKYI0IL5bQkZt4//OkGhQK
 hKge1kMfympNOqqSwnQ1F+AiIcP4Dt/434LT4APszrnMD9KChHARtIdcT6VWY9lFwq71
 Tqbg==
X-Gm-Message-State: AAQBX9fnFX0zrruF6xqmQKxRkr2+P8ttaxfMOCtoFa/WVJdhyOPjQQRq
 L4yLqsusdWPMUBm/QYmUJrZLSg==
X-Google-Smtp-Source: AKy350ZSYRJow6nQrCxmpivd/VrMhoc1Kbi2ON2vTXMUhq7uLz4wkIRazXzoDyv+c3vizfpQvvOksA==
X-Received: by 2002:ac2:4c1a:0:b0:4eb:1606:48db with SMTP id
 t26-20020ac24c1a000000b004eb160648dbmr4364888lfq.22.1681953091328; 
 Wed, 19 Apr 2023 18:11:31 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a2e9dc4000000b00295bbe17b46sm27496ljj.132.2023.04.19.18.11.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 18:11:30 -0700 (PDT)
Message-ID: <e16ef4f6-bf58-0c85-75ed-f8384c7fd7ef@linaro.org>
Date: Thu, 20 Apr 2023 04:11:29 +0300
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
 <20230411-dpu-intf-te-v2-14-ef76c877eb97@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-14-ef76c877eb97@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 14/17] drm/msm/dpu: Document and enable
 TEAR interrupts on DSI interfaces
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
> All SoCs since DPU 5.0.0 have the tear interrupt registers moved out of
> the PINGPONG block and into the INTF block.  Wire up these interrupts
> and IRQ masks on all supported hardware.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 12 ++++++----
>   .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 12 ++++++----
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 12 ++++++----
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  8 ++++---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  8 ++++---
>   .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  8 ++++---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 12 ++++++----
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  6 +++--
>   .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 12 ++++++----
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 12 ++++++----
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 12 ++++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 15 ++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  6 +++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  | 27 ++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |  4 ++++
>   15 files changed, 125 insertions(+), 41 deletions(-)

If there is v3 for some reason, please split this into two patches: 
core/interrups and SoC catalog changes.

-- 
With best wishes
Dmitry

