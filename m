Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC81A74F1DF
	for <lists+freedreno@lfdr.de>; Tue, 11 Jul 2023 16:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D7610E3BA;
	Tue, 11 Jul 2023 14:22:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37FB10E3B7
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jul 2023 14:22:03 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b700e85950so88331561fa.3
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jul 2023 07:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689085322; x=1691677322;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k+V2uuNbOn3Muk9n8CeQ4nOJuVUNz0Zj/TDQmddJIhU=;
 b=S9dQ47SwbBW3oGPhUV8DPizCswnKCe5cJCWx8pO66iA0Mbo5IdI48lHD9Rph7lIy13
 jyKNclwutD4Sbme/JtyALBG9fN2Lyub51h2oUK1OlUtrxo+WlPfNb0zqp+/sRfneJf0W
 RWkWUTngS5QuTK9/9q30zmY4E4UODCZR7EZEKMNJLo4/Lmf+Z3ziTmWkxTfXe9NM6h1j
 eOV2lZKbZyce0WDnu2zdVBJOMukOjBr4gvcFjZSep72SmZ7oBZ2f5yywx73nNq1pf+PQ
 RAEjXJZmE78aFKULmdiDma95XStiGIc0BpFAdLrKKxkpIkKUQtdXk76iGLBuosEiG7ea
 hwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689085322; x=1691677322;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k+V2uuNbOn3Muk9n8CeQ4nOJuVUNz0Zj/TDQmddJIhU=;
 b=Sm4fokznPhvvUkFAsPCFEjQYDVP9DSR+Ks0RUh26eKDmIDiEhsu+bNalCNS5yAsZVO
 asxoV813rZkIjUfPh/Da3PSSd8K151eERb4S65SutH4E/Q6iXodnNqB5iolRQdkY6V+C
 a32KnUTjPY031W6Jp9En5/6pHUyZCKFrheIV4YNKn0H7VbryC06a6DTQPwuPDUqdeuri
 uQwN7J+g7gKSUQIdB0VoOb56JHiPKC9KLOKEqhJk3BJNtP21BTEhSQurjkdSniGW90nw
 3qFGBJ4/CgK3xVCUZm1Msx0pdvSe8NmmlHIZQ+dKs8yDJrzhnaxm/XNm18Yh4hDG0qLj
 vftg==
X-Gm-Message-State: ABy/qLYyrVZN9mEaeKl16CYIrdgBXr0B3VBOXAAcYECDLcUUACA8LH8t
 as/S2Gq2VRgl0CkM14QBu0rIJg==
X-Google-Smtp-Source: APBJJlE/mNiHcKUnyFMHAWcIULKZ7SEoMxh6r0VW3F2iROzDvMcbdiDX2kWWpW+2f/2YQIxM3E4gIg==
X-Received: by 2002:a2e:7c0c:0:b0:2b6:cf5e:5da0 with SMTP id
 x12-20020a2e7c0c000000b002b6cf5e5da0mr13185789ljc.40.1689085322058; 
 Tue, 11 Jul 2023 07:22:02 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 v9-20020a2e87c9000000b002b6b4424a28sm487934ljj.13.2023.07.11.07.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 07:22:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 11 Jul 2023 17:21:51 +0300
Message-Id: <168908465044.1869384.13770179079731144435.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v2-0-733ed383f6b6@linaro.org>
References: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v2-0-733ed383f6b6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v2 0/3] dt-bindings: display: msm: document
 the SM8[345]50 displayport MDSS subnode
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Fri, 23 Jun 2023 14:32:52 +0200, Neil Armstrong wrote:
> Document the displayport subnode to fix the bindings check error:
> 
> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('displayport-controller@ae90000' was unexpected)
>         From schema: Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
> 
> And same for SM8350 and SM8450.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: display: msm: sm8350-mdss: document displayport controller subnode
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c474443b723a
[2/3] dt-bindings: display: msm: sm8450-mdss: document displayport controller subnode
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8d3850881242
[3/3] dt-bindings: display: msm: sm8550-mdss: document displayport controller subnode
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1a1506d2fd7a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
