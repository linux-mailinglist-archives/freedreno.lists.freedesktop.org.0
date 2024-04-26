Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF448B3F88
	for <lists+freedreno@lfdr.de>; Fri, 26 Apr 2024 20:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EDB210EE6C;
	Fri, 26 Apr 2024 18:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XYArujoZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3634F10EE6C
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 18:44:19 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-de59daab3f3so1817665276.3
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 11:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714157058; x=1714761858; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WiA1UHPkUJSpPMTheghbL/TTPsSdmUdeU6jtU/WQ82c=;
 b=XYArujoZbbRTU6+sMocw32ew6sn3KqF1FYYn8k3o/OdssREg7rzXBCwuzDGMyIV2Zx
 tIykhFAdd//U4asq1c4DCEDZLugIR+3kd/uVyVQK+PglgkyW9BsKALCupWj2YbDYrXY1
 mtFesnHtumpdHfFOM9EQ/xPJ6oJMJOxdOH6EQeDa4EsddFkTwgB2h6V9L/nTzJyKZSrb
 nvPz7/n675T7Jlaa3twzUCe7Rs1pLSHxXt5dndoHnzR1jdKfGoIJp8T9vJ0aa7J8ttoF
 cecynJBowhcAjwBAxCltFMigraw7mflmeGwd2KpXlD5kPo1KAZJKdNn6bcpCpUobiFHR
 sO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714157058; x=1714761858;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WiA1UHPkUJSpPMTheghbL/TTPsSdmUdeU6jtU/WQ82c=;
 b=SpNgZs97MIJkv9/B7b+sw27HCPLePYWPiMMwQOjK9DF0MUEL+XyGjTtdQBe3BnDbg6
 g6VjQ9H2VY/mf21UfGoaTs+uc6Nw10Ui/OIO29fqBxyXtZJ5PRji/c8svxMt9c7bP3Dz
 pn8x59XRh7GkVeIWTDQRGEPTNSwjcpx8dk1cwtDMWUUTJOkK/madDz8S65zbj/lne6bp
 n5rRMEtCyUp7xrSMwPM+kkPPEgMH1q9tb377HNNnZKR2AyKo5Axqcr9pss/WLM0n2NS6
 iXAn3qPIyccBqj+5oKKcAc/U6WBsIybJ6U6umO2cm9UgBrLq5/jsbxzzDZaiufNN6c22
 QsBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYDisYiYa40+FSWDV+OpTglIirIzvm4xaFylhcmJnYsyTuM4aEZsoJbs7QtZ3LwI6OW0m3a7pSvXMU/RaeexqN4ASZaYxgykrtdv3CNTci
X-Gm-Message-State: AOJu0Yzk02Q5rMYS5vYdDXV41mFMm2123N8IocDu3LPErCY3N5ZUCpQM
 v3jNuBtKPGCDGK0W8Qv/IT7I8JSzYvjF4wVQtfEUA0KBYlTuGPKWFiCmADHlSfa9iofMY8aiEUV
 RwgZKhs7E5IIdzztsH+Xlsmd43gpcrBvV1fo0hQ==
X-Google-Smtp-Source: AGHT+IH7mi4gG3qx/p/7EOM36O+F7q1UlF4E1n+3QC/o3z4uwxHQybEDslseHLh/YyOCPM7gvMVPXGWCUmmpBIpCQmY=
X-Received: by 2002:a25:5f05:0:b0:dcc:245b:690e with SMTP id
 t5-20020a255f05000000b00dcc245b690emr3787471ybb.40.1714157058089; Fri, 26 Apr
 2024 11:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
 <20240426-a750-raytracing-v2-4-562ac9866d63@gmail.com>
In-Reply-To: <20240426-a750-raytracing-v2-4-562ac9866d63@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Apr 2024 21:44:07 +0300
Message-ID: <CAA8EJprn3P4CKABJcepGTthsASLEqiU4Es06YEoP-PmMRBrv4w@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 26 Apr 2024 at 21:34, Connor Abbott <cwabbott0@gmail.com> wrote:
>
> On all Qualcomm platforms with a7xx GPUs, qcom_scm provides a method to
> initialize cx_mem. Copy this from downstream (minus BCL which we
> currently don't support). On a750, this includes a new "fuse" register
> which can be used by qcom_scm to fuse off certain features like
> raytracing in software. The fuse is default off, and is initialized by
> calling the method. Afterwards we have to read it to find out which
> features were enabled.
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 88 ++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +
>  2 files changed, 89 insertions(+), 1 deletion(-)
>

I didn't check the register bits, but the rest looks fine

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
