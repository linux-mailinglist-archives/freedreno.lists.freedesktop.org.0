Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B33AD6E86BC
	for <lists+freedreno@lfdr.de>; Thu, 20 Apr 2023 02:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AC510E6F2;
	Thu, 20 Apr 2023 00:46:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B93F10E69E
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 00:46:03 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2a8bcfbf276so1669071fa.3
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 17:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681951561; x=1684543561;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E5UTDS8/MS3VS6xHJciTdouskvxQrmpDUWCPfu+muRA=;
 b=RkEh/zVgE9stt/xRUg3A9i8zUpmT5lbttbj/10PoJ4C1ZlN9N92e8hwbRxBw59tBg2
 7AAfFXsQVQ/E3M2gZmI6pmy504+SddSZazkZEJYMqyCMMjlyWIteJf4/waONQ+YggSOO
 YhcFMqq7Tdb/p6Y/44vOc6JfCjxQw/x8eVUkbIh81bpNF5F0gVa/JP50Mcka90h+tc2q
 uxIqy45+53SOjgRYJ9cjV0iPpo2zYo3/nZngdIImonOJ8PzJ4/2/b+RwAF1v/DRTYX1J
 7LwfIhS9tc9wR1QMHVUL6Yg48YQ+ohIply8giG1DSzqHKZse25u3L7hVjNeI6/vvy+V5
 BOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681951561; x=1684543561;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E5UTDS8/MS3VS6xHJciTdouskvxQrmpDUWCPfu+muRA=;
 b=GQIDeCb9g+Cjs94dYFTGcSyuqD1GbpJjKrHSUwqZpouBOKGfdWaNmD1aF2Dy4vE0yC
 +2sfuAWbttlo7xE+bAepZjMfc3RNXEqb99D8guKoa5msmmgOsbqBho3BVhECpqFy+DrL
 X9DZGMTyjfUvpVN1//2PEs+vRzcVfqt+qtYMdq1iaW4pfimbFanSpt0nQEGobidNHZGy
 R1IPmtDX1oNpTNZvaDfvLwulvAkSVGdJ3OAK5ok7pHKoEXnVjKQ+X5FvoHUjcsTpDtfc
 mKKC219PB+Phv2Ty9n5EmWf7hWlR3b24uTf7hJHYV9FCYhlO4vtLI/B77VkyL7wpxbWI
 bj1A==
X-Gm-Message-State: AAQBX9ctXXiR29rSHK3JMO0Y/O7D386y8FCfewX1BAQny7NAs9bXoY2l
 ILOYxvdjYD1+68d6QGT2CF5ipA==
X-Google-Smtp-Source: AKy350YawJTuM7ApeAn2yoXOaxbV6j25doSog73B8n5yooEfDjrMuVNLb4Ul6zgxH8SsKYb4PRQM/w==
X-Received: by 2002:a05:6512:374b:b0:4eb:2d45:f67f with SMTP id
 a11-20020a056512374b00b004eb2d45f67fmr4707310lfs.33.1681951561547; 
 Wed, 19 Apr 2023 17:46:01 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a195518000000b004db513b017esm57432lfe.45.2023.04.19.17.46.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 17:46:01 -0700 (PDT)
Message-ID: <20d415d7-ff04-a4d2-b9f3-5d9f95fb3fd4@linaro.org>
Date: Thu, 20 Apr 2023 03:46:00 +0300
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
 <20230411-dpu-intf-te-v2-4-ef76c877eb97@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-4-ef76c877eb97@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 04/17] drm/msm/dpu: Fix PP_BLK_DIPHER ->
 DITHER typo
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
> SM8550 only comes with a DITHER subblock inside the PINGPONG block,
> hence the name and a block length of zero.  However, the PP_BLK macro
> name was typo'd to DIPHER rather than DITHER.
> 
> Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 16 ++++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c         |  2 +-
>   2 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

