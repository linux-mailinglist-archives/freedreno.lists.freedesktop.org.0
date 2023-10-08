Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A86F7BCEBC
	for <lists+freedreno@lfdr.de>; Sun,  8 Oct 2023 16:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B804B10E192;
	Sun,  8 Oct 2023 14:01:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3133610E17A
 for <freedreno@lists.freedesktop.org>; Sun,  8 Oct 2023 14:01:28 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5046bf37daeso4801486e87.1
 for <freedreno@lists.freedesktop.org>; Sun, 08 Oct 2023 07:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696773686; x=1697378486; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PSMUdpgtTg04OpFZxfxSUvT4pwJGZAYPeTOexRIr+Ds=;
 b=GQxIt7h/tqomMUeSdARf+W46IpZtibwqqfIDXOZLJ5Ewlzpd51fJBCdbXevu4RJBLN
 GQ6xCpB++1EBDwBMQPeB5nBBSsZv6yYKc4zL2Y+DIzEpdqv1tUERxett5HA3mHHJWQNf
 QsG1nOUNi+jOfV8h5hi3leTeSM2OFL9vutw2h87Y2xE6IEETiw/JvIjB0jvY0FJhe+lD
 vcAmLArAoGxagEq+gA7SCdiBHOQeSm1EVGp6UwnLdq+fwmmteOo6nS1G4vTCvBzOEbFz
 x1h5ZZxZ+8/8oI/kn/oFw8B+x3MV2MmeBXbMMHOJ8vZCcTWNF3xIwRXSJ3Ls7vgOKh8E
 R9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696773686; x=1697378486;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PSMUdpgtTg04OpFZxfxSUvT4pwJGZAYPeTOexRIr+Ds=;
 b=PzxG/hkX/knPPCPbokcyJB4td+P2m0BAvtV9jqWhxXVCQFVdHIZup0za5yi0laK4om
 1bR9p+DUa+gDTi+BVtjPb+yZw9gbJX90dtN4/GNgiUtPV1xffpPdK9e7PNrZqaaS2Ooe
 LLCrzYAUwCIcsHj0PClHe/888ml662C3CrEPqQnWGfkDUVeR/kyohUIabKrS861gxMCZ
 eD7SYZZxmUGASEJiIiz9bLaHD58JuINcL3DTHe/I7PWq2oExytg6I4CrrEQZNA0IZIXA
 oyxAdRcpCgzCVbjQSeF30hxdfDk+Zq02F5/JRh/bXaeRyI+YrUapXrYnhj80VPP1+5pQ
 y1kw==
X-Gm-Message-State: AOJu0YzuXvPJYbPOEwrRBdXxUXrXW/Rnb4mThokljgdsnC9IGnzXPPcm
 XHG4sYWMRMQpuPWhqlVCThNGHA==
X-Google-Smtp-Source: AGHT+IGxfVDd6z3b4aL3PVKq8C7Mjb21gUGAEM9IbcbsGG5OCtfSfwwara4kEgcUl8RPGr9RfAl4FA==
X-Received: by 2002:ac2:4a81:0:b0:4fb:8585:eefe with SMTP id
 l1-20020ac24a81000000b004fb8585eefemr9557457lfp.57.1696773686418; 
 Sun, 08 Oct 2023 07:01:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q14-20020ac24a6e000000b00504211d2a73sm1080455lfp.230.2023.10.08.07.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 07:01:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Rob Herring <robh@kernel.org>
Date: Sun,  8 Oct 2023 17:01:17 +0300
Message-Id: <169677325602.2570975.10339984139706350311.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230925212434.1972368-1-robh@kernel.org>
References: <20230925212434.1972368-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 1/2] dt-bindings: display: msm: Add missing
 unevaluatedProperties on child node schemas
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Mon, 25 Sep 2023 16:24:24 -0500, Rob Herring wrote:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present for any node.
> 
> 

Applied, thanks!

[1/2] dt-bindings: display: msm: Add missing unevaluatedProperties on child node schemas
      https://gitlab.freedesktop.org/lumag/msm/-/commit/08bf97ab16f3
[2/2] dt-bindings: display: msm: Make "additionalProperties: true" explicit
      https://gitlab.freedesktop.org/lumag/msm/-/commit/55bbcadccdec

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
