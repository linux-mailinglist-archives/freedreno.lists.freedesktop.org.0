Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE4B6E60BE
	for <lists+freedreno@lfdr.de>; Tue, 18 Apr 2023 14:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A362510E785;
	Tue, 18 Apr 2023 12:11:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDBA10E152
 for <freedreno@lists.freedesktop.org>; Tue, 18 Apr 2023 12:11:01 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2a8c30ac7e3so14773711fa.1
 for <freedreno@lists.freedesktop.org>; Tue, 18 Apr 2023 05:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681819859; x=1684411859;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fftkJp3Coct54pcoJxqOJznZa4eb2ZsBLmF7Bh2NPzw=;
 b=yT/BiOHJ+Wb2Fowb5VKhN9CkH2wqsNJE9NMZRSDGk4DXvenGL6eOdB8DlC/etQesDw
 dtOy68VZtrLhULwcn9/Mi9WT7Y8P3NAvFpLgTBxc+8AIDLGEScilP24Dh3AA/nx4wMOD
 j3Z9Q7BlS2bnKN139hMOkzsDLGoMk0fPulZVUEm5TosYsVVqzQMizwSXVbX72TBmvagL
 looqHnRRbrN27J2r3pebd4DSAIVDVFu/Et035MPmkDkjTuMHAluOrpHYbTTgAUgD0AYe
 dP3Kq03ixRHzCPq7IzoNQ3erAJ/HIQVJ4AfwP3pg49snXLAoXuIq8GSkth6QU20GOrmB
 YCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681819859; x=1684411859;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fftkJp3Coct54pcoJxqOJznZa4eb2ZsBLmF7Bh2NPzw=;
 b=G79tiK56cWMk2xD6DZE66mi6bXcJqw0xxogWZ7xR+HSWP9Rhj4i23vnu/A8JIN/EPs
 vBgp21yHqLchJXnQvL9mNWNbxoKQm25UpFv7iARTM6MxLobLHrnEVsbhEwFSDccCsBL3
 vTjDBss2ypvXFhNrBcIB9KZ11gjRFKbkWnXTDlNat5z1BXU+nk9fJ7V/0X5L+dh3pfs3
 aVXBKXxLUnFhNqJQJkncv8FqegX5YW/P7OAilWrP8z4Ibcw3ANuM/cH0K9dV/OJSM4Ck
 pYaveR3+fXTPlqmptDLh96TkifiHBcCeOx8MIsAM+f9Okvf79fgftwOlFOXp57osU/53
 Ca7Q==
X-Gm-Message-State: AAQBX9dHlrYjEIoZZTSSBIC2dmsmmCoKZ4uwcnjWWLkzyTXvfrtPGUkJ
 DereBt3wmQI0B2ecPdktZ+RNLQ==
X-Google-Smtp-Source: AKy350ZPb2pcudeOWD4NUzexqOVtDM0ulgBKkxy07npJmGB5XjCQyP1ClBYjw6LCleNLEPUOy8LFOw==
X-Received: by 2002:a19:f70b:0:b0:4ed:cb37:7d95 with SMTP id
 z11-20020a19f70b000000b004edcb377d95mr897901lfe.44.1681819859602; 
 Tue, 18 Apr 2023 05:10:59 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a19a411000000b004d86808fd33sm2365895lfc.15.2023.04.18.05.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 05:10:59 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 18 Apr 2023 14:10:56 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230417-topic-dpu_regbus-v2-1-91a66d04898e@linaro.org>
References: <20230417-topic-dpu_regbus-v2-0-91a66d04898e@linaro.org>
In-Reply-To: <20230417-topic-dpu_regbus-v2-0-91a66d04898e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681819856; l=1310;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=9eGzIhdzE/kh12Ssb8zLi8BB+5t4kj0lnuayorvjl54=;
 b=6fysWEnV+Y3QmSTMiVPNmoQ9u0QIAaEjvJEkX1mj0vdB2azvjMKBFTXFeb43KILmDBjB8FFs4iVp
 BB/S89PrA4Ytu9jBc2Dfi9OeeG/7wbARaGTUTtuRCJrQlU8X+ytt
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v2 1/5] dt-bindings: display/msm: Add reg bus
 interconnect
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
another path that needs to be handled to ensure MDSS functions properly,
namely the "reg bus", a.k.a the CPU-MDSS interconnect.

Gating that path may have a variety of effects.. from none to otherwise
inexplicable DSI timeouts..

Describe it in bindings to allow for use in device trees.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/mdss-common.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index ccd7d6417523..30a8aed4289a 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -66,12 +66,14 @@ properties:
     items:
       - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
       - description: Interconnect path from mdp1 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
 
   interconnect-names:
     minItems: 1
     items:
       - const: mdp0-mem
       - const: mdp1-mem
+      - const: cpu-cfg
 
   resets:
     items:

-- 
2.40.0

