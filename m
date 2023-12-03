Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B8A8022D8
	for <lists+freedreno@lfdr.de>; Sun,  3 Dec 2023 12:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE89C10E280;
	Sun,  3 Dec 2023 11:26:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F45810E150
 for <freedreno@lists.freedesktop.org>; Sun,  3 Dec 2023 11:26:39 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2c9f166581dso11155941fa.2
 for <freedreno@lists.freedesktop.org>; Sun, 03 Dec 2023 03:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701602797; x=1702207597; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vYGb31/GvDPJsBFOKGrOafxuEsUy0gUvwyHcMJDnEIw=;
 b=WwaCUMA4GUUxiQLtjMQjqWLuHFD+ja3n8YYPcHRYcVcuxwp8ySL56vZgLY1/olfrRy
 HP69ra7a3hX1xIF8aSVXGmZEcB7+i12qzCqXMUv4lfLxH3TFwbrGwB7iUt0uwFYB7TUd
 iHBtq9+R1HJBI6KSO4lb0DzmHHTURVMmj7D/hVLOurTOB8K7qk3SRC0cRVct07frH8Ag
 dSbJqCGU4MhbJUw96z2ZwJT6zJvJFWV5niHQ3VDm0IM8w3s+ss2meyqomU+QjxfklmU6
 fvUEGLWowMDbvRdAFE5cUarbfdRPgpamgaZ2toCU+zvZJOH/WsnlGoDPu46UrKq/HwrT
 q9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701602797; x=1702207597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vYGb31/GvDPJsBFOKGrOafxuEsUy0gUvwyHcMJDnEIw=;
 b=Hrh0nBTBxUpPlMAuFJeuS8cCuRm+BK4FbxW9NFhOuCtaX+8vQMV5+UgvnVBRrdV2Of
 FiEzoaI49tWqIyaUsqbPnei7IOOwJLZiXFb0J/Nvs6GHwD9cg0D1hulNQ0jsU9AxcLSM
 RzNd9h+MA850a/zQN+vKUi7acuOC+TGqZhsL3m7TdKpbMxQfY3z/I2940XqYbe5ER10N
 IydV3LwlxNXo0xJ73L+i+paQCeOO5FBPP9yTJIdSELUH34HGK7mssVuXnThIerV2TRdZ
 brkRBO2hhNegAobrlWy39/W/EpJFzF4EqOCX/oSC9KnvrSqFGnY3kU3OGyxfj+GzPZLO
 So5w==
X-Gm-Message-State: AOJu0Yw11A3o0HijbGczYZmYMpGVeDjrxhnxhtXN1SPTIg+cqckNqOrH
 P61VWkYFq8Mi9iCsgLJ0M/SIbQ==
X-Google-Smtp-Source: AGHT+IEizxhWQJi3VQazccosbJ0mirj6XMMfi7nH6/rfvt2MEcHPNTAfYO5Vehd0QrtjXGShm8OT5g==
X-Received: by 2002:a19:ad4b:0:b0:50b:d336:3170 with SMTP id
 s11-20020a19ad4b000000b0050bd3363170mr1969173lfd.12.1701602797619; 
 Sun, 03 Dec 2023 03:26:37 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 03:26:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sun,  3 Dec 2023 14:26:22 +0300
Message-Id: <170160265537.1305159.8541320986435504084.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230620-topic-dsiphy_rpm-v2-0-a11a751f34f0@linaro.org>
References: <20230620-topic-dsiphy_rpm-v2-0-a11a751f34f0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v2 0/2] DSIPHY RPM
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Tue, 20 Jun 2023 13:43:19 +0200, Konrad Dybcio wrote:
> Some recent SoCs use power rails that we model as GENPDs to power the
> DSIPHY. This series attempts to make such configurations suspendable.
> 
> Tested on SM6375.
> 
> 

Applied, thanks!

[1/2] drm/msm/dsi: Use pm_runtime_resume_and_get to prevent refcnt leaks
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3d07a411b4fa
[2/2] drm/msm/dsi: Enable runtime PM
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6ab502bc1cf3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
