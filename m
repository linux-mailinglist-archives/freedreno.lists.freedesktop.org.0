Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E2D6E86CC
	for <lists+freedreno@lfdr.de>; Thu, 20 Apr 2023 02:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC0D10E6F2;
	Thu, 20 Apr 2023 00:48:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B840110E69E
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 00:48:00 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id q21so1056599ljp.0
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 17:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681951679; x=1684543679;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YiCUqcs8l7xs68tLNiwLGoxcdTG7gnnvZNDM/XdASOU=;
 b=PoyvA1eEAYWocdqr2obXGcJHE+fvbQjI0qCQ7kJZHpUGLDtxBgt98xhAYPL2szwO71
 UOoAmVBnhNqIQnsZwO9xV0V0wO7ZcQh+usaHyIbf9mnTonhpcbyrSkFbp+fgK/IYb76M
 AS1oS4Iq6LoFjjExYSAQ3TEkvYyfXp1y2oq0D2c8+LcH1/TLMIAoLMecGCRJ4KxNA04D
 SKazSnLDFhVs+8294KibSTVfoUma0Wt8z3VAJnBRbQPU8uqiOwE7BJtyKhL+yUkTHYRL
 7jzrsIqVdUJTpBub1MLIhf3+b46rMhmLNT74cDulD6097QE3r9o9Br1Z1Y0EYdkGUcbN
 HYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681951679; x=1684543679;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YiCUqcs8l7xs68tLNiwLGoxcdTG7gnnvZNDM/XdASOU=;
 b=YD2LDmOR/w2pBKUMsxxlIgIyLxby2QCuwkuuA4OWT+vQgRlqocanNf1ktW7lgwB0Xn
 JrsA/e3NIE12Jy6YDqam+GaqXol3RD7wBzYXMM/+jUd5oPa7W60hI2r83pMxtTBecwnS
 OB9B/eUy0e0h8X1WhHwVeltqZ0z87t2CcX8Db9tNRcoqksRNSip7ccnQ4t2KP9mcQ0UO
 PTLpkvRiQ1+Aw1w8kWYcqHiy2b2f0RS0qgtOYbN7KttMMyUAZbkhwUFEyjCdIJ/g901U
 t0MAVbS2H/+U4WDIgrIo5LCO8TakwKzup8wtzbuiRpSPlo91BMNw13+W4Zs5q6TeKkPb
 nDRw==
X-Gm-Message-State: AAQBX9e1+L2FPidER+7KD8rhlOua6pFH/OK7wLpCX0SO/ylVuC8rovTw
 yqsExjaQspYrtpqxEXsbcuVOZA==
X-Google-Smtp-Source: AKy350Y2g0JyuJdB83x5keVTBl+YazhmfiYEa4/oZG/Tc6iQyRwmtDas24d7wHonjcUHxtv75FKVsw==
X-Received: by 2002:a2e:9917:0:b0:2a8:c1bf:5ce2 with SMTP id
 v23-20020a2e9917000000b002a8c1bf5ce2mr2169890lji.7.1681951678855; 
 Wed, 19 Apr 2023 17:47:58 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a2e320e000000b00295da33c42dsm17379ljy.15.2023.04.19.17.47.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 17:47:58 -0700 (PDT)
Message-ID: <f9e8a86f-3c69-4fda-01b9-2d4cd261bee8@linaro.org>
Date: Thu, 20 Apr 2023 03:47:57 +0300
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
 <20230411-dpu-intf-te-v2-7-ef76c877eb97@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-7-ef76c877eb97@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 07/17] drm/msm/dpu: Sort INTF registers
 numerically
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
> A bunch of registers were appended at the end in e.g. 91143873a05d
> ("drm/msm/dpu: Add MISR register support for interface") rather than
> being inserted in a place that maintains numerical sorting.  Restore
> that.

Assuming that = "sort order":

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

If I don't forget, I'll fix it when applying.

> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)



-- 
With best wishes
Dmitry

