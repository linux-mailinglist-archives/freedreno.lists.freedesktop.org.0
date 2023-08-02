Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD56676C9E1
	for <lists+freedreno@lfdr.de>; Wed,  2 Aug 2023 11:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F88E10E1EB;
	Wed,  2 Aug 2023 09:55:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BA310E52D
 for <freedreno@lists.freedesktop.org>; Wed,  2 Aug 2023 09:55:49 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fe2de785e7so6057940e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 02 Aug 2023 02:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690970147; x=1691574947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iphRN0MY2MtgUPU4uH8Er2X1AyiNge9v/N2Rem14Rkk=;
 b=kDG43E3P3uN1JBiNHnopTh43p3mXSgOkLZK6mwJSdib/57no5KTRao5OzZBLuhptDC
 ghR39QWLnru3WOP7sAD4T/t3C46Xemqit2GoPULrPAEEyNWwmqaabkZJfNNLd0LUKt+4
 BmnvkorSd67mZd3TRZnJbjIwPjfrpvlGfXna9rVCogjrG8wZyyHVoq0xuuh/M5zLGmrK
 ZIMb9hmToJTPPCN/mdFfncrcewaLF3lUmaUc9YWUbAhRzEzKl+7B7QBqfcfuISWgF1P4
 3Fofq9ZDMmYSPgFhxsd0nvBUBqBwoNZVYyfRmIcn04lfGWCP8hkCioiBiijqXG1P+leE
 SbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690970147; x=1691574947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iphRN0MY2MtgUPU4uH8Er2X1AyiNge9v/N2Rem14Rkk=;
 b=b5KzcCCvUSDlTdOjydtykAEG4wmBPWE7qfuqZCvigUpHq4T4PEsWMyd10OaUHbSRpO
 7THiWlOPn1CiH1HiHzZSE2IKOA4uXfrk4X7BMwE19vVPUD0Dx+uIDrgGsV3D6IUgYyPx
 HHL3CB6D1qFErGv7SuAaOZQ2ezolXK8JDaVuCNpJXAAqwKR1x+pWe+9NWNlfpb0ocXw9
 vdKExxKROzrsdcbJ5+wbkZg4j2jWcf3J5kugReHQckFxfRkU+hdX2473fT1UEfT+MnUq
 Bbgfg8rx5X97fTtmPNxmtkfKEntLMIbgDntZRtceCz7G1adl/JUTH2ExgFnADOkbY2u2
 gB1g==
X-Gm-Message-State: ABy/qLb40CzJiNgexqZYgMbeE86/imOW8YUc+y1Ze8qxzQ2GfISikecc
 ffrFwkfP1zZh2M9Bc9MNW/UGhw==
X-Google-Smtp-Source: APBJJlFze9oTSl4rl4neTa9DH2tYbdCR8ijsBfdrqqCX/nt9jY3FI/jy/9N/lk9Os3h4JTx/WBMWHg==
X-Received: by 2002:a05:6512:78c:b0:4fd:fc3d:cce7 with SMTP id
 x12-20020a056512078c00b004fdfc3dcce7mr3645729lfr.44.1690970147400; 
 Wed, 02 Aug 2023 02:55:47 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x17-20020ac24891000000b004fe1960dd7csm2779762lfc.132.2023.08.02.02.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 02:55:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Bryan Donoghue <bryan.odonoghue@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Amit Pundir <amit.pundir@linaro.org>
Date: Wed,  2 Aug 2023 12:55:42 +0300
Message-Id: <169096995982.4183272.12912811169015846101.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230726132719.2117369-1-amit.pundir@linaro.org>
References: <20230726132719.2117369-1-amit.pundir@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v6 1/2] dt-bindings: display/msm:
 mdss-common: add memory-region property
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
Cc: dt <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Wed, 26 Jul 2023 18:57:18 +0530, Amit Pundir wrote:
> Add and document the reserved memory region property in the
> mdss-common schema.
> 
> For now (sdm845-db845c), it points to a framebuffer memory
> region reserved by the bootloader for splash screen.
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: display/msm: mdss-common: add memory-region property
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b4b405040689

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
