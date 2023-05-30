Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B580715F35
	for <lists+freedreno@lfdr.de>; Tue, 30 May 2023 14:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016B810E059;
	Tue, 30 May 2023 12:27:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765EC10E14A
 for <freedreno@lists.freedesktop.org>; Tue, 30 May 2023 12:26:58 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-514924b4f8cso5478438a12.3
 for <freedreno@lists.freedesktop.org>; Tue, 30 May 2023 05:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685449616; x=1688041616;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=stytcPLfmtfo2fgiuSzdRWfNyIk7zVG1HeYjVvCDz9w=;
 b=gfCtr7jZXqESNbxzXiO43l3qqczxibfd/8w9kd1Ym8YdWhXyG+fyLdmQMpEwRJKnLX
 9CDjSBYhIeVFltkeDw6O7TZhpN4ll73Ic+iWAWQazQlPM/ceWi/cDavmggYTsBKvUASV
 M6XloXq9jSWBv2+6ermKsbpEfF9PDrvNQ5TfLnbNOBsaXF4WOoln+deS7pYJ+eRfKA2W
 FsjnppkAX32eN6OEzpNHzIxIwiHZBKMlK7lyRfmgHUD5DcyxstEfzXndYdKrIJNjIKsA
 Ll+gsI3BBLsHgdonbzLUfx83IhNiMrctNLGvHNsMHAicOLaLYPIyyfHbosoQGidJXN57
 hMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685449616; x=1688041616;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=stytcPLfmtfo2fgiuSzdRWfNyIk7zVG1HeYjVvCDz9w=;
 b=Q/AJ7t13/w3UBppL6v3Qyn7eNawu0Ki063RH+qrZcwIgQOs6uffoeJ+atOpThLnLXt
 +kwu7PyEJjUZui3MY3HmglNSNKuIIf8x5KZZ3agr8Hj/B1w1tb14PpT01SVdMv9UerVw
 KDuoXdFIpLPVB48QC+5S5T9BudHKZ8P2j0g5lXgqOduRzkqwOdTUW5JZPgEbY+8n+79K
 grOp9kjFpZD3GD7jW3cMcoSBoC7Lmhn2TKZas53CzGvgWI0zlf3T3feKMAFEDMyqRG3M
 5gL7dpzxMOahpYoOaT8/Wl7GQnUFoo3vEy9ukxZIU0RyyUGM5eCTiaBChqaZ3HJW4p9i
 O/EA==
X-Gm-Message-State: AC+VfDxYD3C+ICObxgo+pp4gioyiE2uXyjjwLuvg8vBBB7kXTpZmQ+kE
 7SJnM8gUW+KUo+Sc+eUSFm9IAA==
X-Google-Smtp-Source: ACHHUZ66izEDUSaQQp76hTrSWMdC6fb+uAdYBYs6F5ndxLqGKRKd2/soK1F7uCXH6BQ11yXPM73REg==
X-Received: by 2002:a05:6402:693:b0:506:83fc:2dab with SMTP id
 f19-20020a056402069300b0050683fc2dabmr1537814edy.22.1685449616416; 
 Tue, 30 May 2023 05:26:56 -0700 (PDT)
Received: from krzk-bin ([178.197.199.204]) by smtp.gmail.com with ESMTPSA id
 z4-20020aa7d404000000b0050bc9ffed66sm4302283edq.53.2023.05.30.05.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 05:26:55 -0700 (PDT)
Date: Tue, 30 May 2023 14:26:52 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Message-ID: <20230530122652.lct6tk6zseny6gxl@krzk-bin>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
 <20230223-topic-gmuwrapper-v8-1-69c68206609e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230223-topic-gmuwrapper-v8-1-69c68206609e@linaro.org>
Subject: Re: [Freedreno] [PATCH v8 01/18] dt-bindings: display/msm: gpu:
 Document GMU wrapper-equipped A6xx
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, freedreno@lists.freedesktop.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 29 May 2023 15:52:20 +0200, Konrad Dybcio wrote:
> The "GMU Wrapper" is Qualcomm's name for "let's treat the GPU blocks
> we'd normally assign to the GMU as if they were a part of the GMU, even
> though they are not". It's a (good) software representation of the GMU_CX
> and GMU_GX register spaces within the GPUSS that helps us programatically
> treat these de-facto GMU-less parts in a way that's very similar to their
> GMU-equipped cousins, massively saving up on code duplication.
> 
> The "wrapper" register space was specifically designed to mimic the layout
> of a real GMU, though it rather obviously does not have the M3 core et al.
> 
> GMU wrapper-equipped A6xx GPUs require clocks and clock-names to be
> specified under the GPU node, just like their older cousins. Account
> for that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/gpu.yaml       | 61 ++++++++++++++++++----
>  1 file changed, 52 insertions(+), 9 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1787121


gpu@2c00000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/sm8150-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8150-mtp.dtb
