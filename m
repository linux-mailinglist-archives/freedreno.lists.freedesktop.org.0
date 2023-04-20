Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 746A66E86B7
	for <lists+freedreno@lfdr.de>; Thu, 20 Apr 2023 02:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA4810E691;
	Thu, 20 Apr 2023 00:45:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8B110E691
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 00:45:29 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id z38so907640ljq.12
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 17:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681951529; x=1684543529;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wtWB4vlmwDWMUNOsfffP4l09F42Qg5zHNV5DdtGMrBA=;
 b=wvXFn8cl6fUCSLiioYT4nXeZK0/nwW5kFU11F897WcQOvLHqmBDcyaCvdxhiq5Ngf/
 vjRxK1PhhkR39Y9a72mFRI0eZlh1hn+VjNyeiEL7rkewAz2ejRZ12q6454kEB765HmaF
 34fIdq0ePri9LQSSOVVcHobT9x/BYwdBKXva5XNaEHpWb34VCkY/E5GuZ2YY5ZOXtwNn
 ASBnxpQ+vCplQItgXOV94nQ2QyHc2hBDWPBRoe4nxyrdmMsduVF/+Xtl6ASkXhi70NMF
 QWjh90k4BXW5dj0PcdB42i35lM3G9eYQN5TJGCWD4BbukFOfcpQ4fzJbSd2JXW+EbJh4
 B0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681951529; x=1684543529;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wtWB4vlmwDWMUNOsfffP4l09F42Qg5zHNV5DdtGMrBA=;
 b=Es9eSb/XMmccN+Gb9vlgc0xDc9uhOzt/zM7oEFKkP4kTyaZuAxfSZCRFaI5mSPl+UW
 E7/XaPLth6XQBLvI/YVg7s/lahu2TpynFbwE5/Jk7Af6Q/l3Oqq1fLL/mYbLX89Hnrrw
 JDeHrh7FCPWZwsISUHxmIvq0cZRqeANot1SffKDa/o6ViFf+Yo1HTrpyw/FE8j7xbhln
 FWVr736gOxhCFupDTK08oEw/CAHgBrOKNqxIkBxnrX1vwV4QIhIiW3F3nPOYdEydXe3w
 0qh+H+N/Lj9B7zv3OjztPLJPwsq/apdZjQOTfHmZ6oNCg/3I3bcgQHLLkXyB11snCJJ9
 koxA==
X-Gm-Message-State: AAQBX9ft8KadnpgdwSi0OlIoQZp92zLvYNtxha2l7L5d4a+f28wTLsiC
 ICpH1MhpN0dIBXVCovc9NXe8Zw==
X-Google-Smtp-Source: AKy350ZhjSkwDpeu1n+vje/43uN5I9UnV94ZUO73jsf4x9QrMfjxL5w7ChBm91Ulj1soJ6h4wWflxw==
X-Received: by 2002:a2e:91c8:0:b0:2a8:bca1:bfa6 with SMTP id
 u8-20020a2e91c8000000b002a8bca1bfa6mr2832002ljg.24.1681951529261; 
 Wed, 19 Apr 2023 17:45:29 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a2e868e000000b002a775f96ef4sm16431lji.30.2023.04.19.17.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 17:45:28 -0700 (PDT)
Message-ID: <2c9fe675-b580-9f87-8b20-f4e125bf88a3@linaro.org>
Date: Thu, 20 Apr 2023 03:45:28 +0300
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
 <20230411-dpu-intf-te-v2-3-ef76c877eb97@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-3-ef76c877eb97@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 03/17] drm/msm/dpu: Move non-MDP_TOP
 INTF_INTR offsets out of hwio header
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
> These offsets do not fall under the MDP TOP block and do not fit the
> comment right above.  Move them to dpu_hw_interrupts.c next to the
> repsective MDP_INTF_x_OFF interrupt block offsets.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 5 ++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h          | 3 ---
>   2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

