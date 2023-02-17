Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D15E69B4B7
	for <lists+freedreno@lfdr.de>; Fri, 17 Feb 2023 22:25:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4B410F0D2;
	Fri, 17 Feb 2023 21:25:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6E110F0D6
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 21:25:42 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id bx13so2373514ljb.3
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 13:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ORR0AQhnlGMPN31e9mPJsCgrOnth8Cg37H+T3TwuNc0=;
 b=EoKqClsxJvczaooILRkmTBpck9RRYIHxHhARz8ghkE8ju8QcDyIPrBdTfevR7Z7AYF
 bQvRcgTxf3QXT3o+H7K62Y1yvdZ99qrQDH+WtYWTyVIw80V+nDv62YyBoaZKLIAbH56g
 jf3LIQbBz8bo+W1AvacimbCzHm/J6YBzWx1Wn8MLFLclXLAvF0jnke0Mvt6d+RMbJx/r
 qRbrGwgZxk5J9sZMf9Yia+L+eo6jHfR+gHpeXfVYCtPECh32Dmuez+UhF9KDPoQNms/+
 KGUJ1wv4V2NMYKV55/yZrCYnbb1fQcmwca5HaYPXOprKOubiHt30ejmd2g3BUdl7aHdK
 f8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ORR0AQhnlGMPN31e9mPJsCgrOnth8Cg37H+T3TwuNc0=;
 b=gpcIbyoIUXDpM2OEDs1Ex4OKp/yMivPX9rTtLw2MbDCudfpYXdkfqDiwjAzY+hdWFl
 1+L3pxkK/JDpNP2mb+2CZdHgnya/RtfQerEY7Wa9ApyI0lNzqAtvH8VqSTXKsHgt40kE
 zoSnHUmtLYpM3oPm5tbOQNCP6ZlmSVHDzB6qwILM81Ne0FsK/gUiqCi3ncu/tzXzV1kX
 J1wPZyVouWf3sgysNOKUeQNhc7tRNRXGxXwkGEC+jXmYogguwwh4dmwgivftL25maOJZ
 FG3tWfYlSVwqtAtg+UiiktNbZctIGRSG/Sj2qqB0LEEP5P8A2Xw0KVq63vbnUt5ySqpH
 j75g==
X-Gm-Message-State: AO0yUKWAxOJpTLIgrQs89X9VC0n/BFglWKoS3q8rYMnzxB8r40/5i83f
 n0pZAPnHPuILRogaxI+RInZezw==
X-Google-Smtp-Source: AK7set83FcpuRjdr9aqb+dOcUa1SF8I+J/myUtqrLeob8tTbxS+Ehimel0K+msGa0mKWSfujy0Ztag==
X-Received: by 2002:a05:651c:2118:b0:293:4ba3:17be with SMTP id
 a24-20020a05651c211800b002934ba317bemr1091977ljq.11.1676669140539; 
 Fri, 17 Feb 2023 13:25:40 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x2-20020ac25dc2000000b004db513b0175sm783715lfq.136.2023.02.17.13.25.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 13:25:39 -0800 (PST)
Message-ID: <a13997c2-3b68-7c30-2486-c56cb7b72170@linaro.org>
Date: Fri, 17 Feb 2023 23:25:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-15-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230214173145.2482651-15-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 14/14] drm/msm/a6xx: Add A610 speedbin
 support
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 David Airlie <airlied@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>,
 Chia-I Wu <olvaffe@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14/02/2023 19:31, Konrad Dybcio wrote:
> A610 is implemented on at least three SoCs: SM6115 (bengal), SM6125
> (trinket) and SM6225 (khaje). Trinket does not support speed binning
> (only a single SKU exists) and we don't yet support khaje upstream.
> Hence, add a fuse mapping table for bengal to allow for per-chip
> frequency limiting.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

