Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49264BD962C
	for <lists+freedreno@lfdr.de>; Tue, 14 Oct 2025 14:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0376D10E5F4;
	Tue, 14 Oct 2025 12:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W0lcaXs2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB97810E5F4
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 12:39:53 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-46e6674caa5so27539275e9.0
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 05:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760445592; x=1761050392; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qz/PnsLNKphGj4wu5t6w0DkX4PTYLFQZn42Nmg+SPjs=;
 b=W0lcaXs2vw1MAXESFX3P+u+Pr3WmFH3N/ILitAiBHg7edehWowdgSg2acGqnBGjBi6
 13n6skK3/frOtpjXBiUgBUx73M6E/FQR3M+URQXU9lj3S2SNYimmOJY7KJU+Iee+HzVL
 ZW6g6AkKaoO9itbjAiD7Y/SjbBmMj/TMpIUjDZ8AX8RS0Pu9XChYFSm+91naMM9VzSI3
 QnfsSRil27qIKzzpNVl2QMst/faAXlAnEQYHOhvu1CelvGIfhamQz0csRqsb4iDB+VBN
 qEh1sY19B2gBUfmqfKuIKdSP3WPVElp2nMA/TVi/eFQK3+09eJYO2lU1MewF+E1HcCnE
 Vrnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760445592; x=1761050392;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qz/PnsLNKphGj4wu5t6w0DkX4PTYLFQZn42Nmg+SPjs=;
 b=lm+5qjE+PJgjYhAlQajzrJSnXU2BeMwF9hf/6xlJ2FPqc/2TIFdA7gMxlG68G58LuW
 Q4w12elMuXSd31QEUVCnt0zQC6pU//p5gPVQZbqqr+usgkf819KgBEOT8vJNonChTGRS
 H6ZXaId9dUaGHdqH4PwWtss1s/p0JbcBm9KXVsHhVuJ7lKo1nAfeK+9iU0I4nZB9ALYo
 bu94h+NbOSfLctRe6+P4AXr4g5Os2G5PHQ6rjjqSxzjuZ+tu2PWku3l4LiF4kjmSF+4P
 GEgiy88gbBPjJCYBH3eglJhWJmspYEi+8XldPoGIWIGjzQj0RU7iv0HVcrCzVC8CA2Wz
 L9Gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPB7tVCPRwsWZuHLJf4UCvxCMY7NuOpTDDIZD2SYanbuuzAJbs7CkQSZVM3IQ0UfmkxaLiPyGMX28=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKDC8lWVB961aJ457lX8eiXE+vCB5QMBKje+7baAIoSYwGJuJo
 7L7e/3vNCnWYkXkUSNJgwtJNny2CaUfU/oLLXQ+TqLXHjfISC5LvSAdd2NmPdqt49k0=
X-Gm-Gg: ASbGncsGor1QYeYRrR2Usug8lTNA5LfGfeqIjp8lANwd/fq9kJqrJkEhQWNZexZIlI6
 H33wHB9rzIc5C4WffcCFb48I/QVSKnSJmAwO5qInivl/I3xGguWj0GvLB+9iTanI1HK/hqEv5ZA
 HeMkuUuVt3TZO1KkpSw+CXVjrS+uBfj/+D0zmtSbC5QsrWwZTgvRP0RDRbEcmYR1XDMCObjFGJj
 evCaFUtc6eio+YmvJnc9TNDHsBRCvQ6mAYB2JW3DZfg04AFaqKFBjyuhH9GOYfW5kHme++TlIju
 JwH2SX+Hl6RzXmYVySDO+dHiGfenzI8EC/IXo1eZScGouIae/lWWuZy49X56fr0s8bGnEIHKIIk
 SqtXm84LG4Dx6KqvuDMAQdEmDUUNWPgbil4cQUeeubpXAsuxENqMVqg==
X-Google-Smtp-Source: AGHT+IHzYJeuQSSdvaVBjpsWcRolFjsrBPl+V+3N9Q0foLP2Jk9xC8lRLIlq37tnavPAFSq2mfhuYA==
X-Received: by 2002:a05:600c:8288:b0:45b:910c:adf with SMTP id
 5b1f17b1804b1-46fa29e1c33mr195599705e9.12.1760445592221; 
 Tue, 14 Oct 2025 05:39:52 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb482b9easm245813815e9.1.2025.10.14.05.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 05:39:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 14 Oct 2025 15:38:28 +0300
Subject: [PATCH v2 3/7] dt-bindings: display: msm: Document the Glymur
 DiplayPort controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-glymur-display-v2-3-ff935e2f88c5@linaro.org>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
In-Reply-To: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1535; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=MdFy/rEtddPgNfs1nNoPDNK3EzZtOK6/402QnuCksD4=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo7kR/MpIlema7vtLO10UuZNhTbFIUHH3e8z84D
 RD9ZYXA9NmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaO5EfwAKCRAbX0TJAJUV
 VotJD/4pqgqFjwMjWLdSHRE8WR5WgFHxPv7BKsET1/cjItFQcfJdEmvTVQM2JhaeXBC3ID8e4r8
 ZUFwza4CdlWeAu2e9AOADQaj75EC+ESZYnO5xKA66sPTWOgqqVqLBtiIYLChP+amJNT4h4asBnc
 /TbZAn3sKR9AIV/DnPYO4jd8G5ixRVlIXMdiEmO8BGtsIkZ8IfsyLR6ETj2k/qZ9MRPW6fCE+o+
 efAXMnFFUZmq5DtPsJhH3lY00BWyKSjU/yO+xdSLBqQWD3uuRJgawppPogzmvuCS9leP/+vnROX
 lEl2LQrx72CvkyZcCYnjlNHr9L1CCa0k94m6FTZZ4nDBa1DSNaX6LK6AzZBbdfoMo4UlAYzx6nw
 cGviSA5kYeFFXTVB/E2WfCGsTovozMhbZ9fbbHw4XAFgyPm1mrFlWd/7zA/1TQ4Q+Fk1xGYvVjH
 hP0ozzif5id5Yy+cs55bW+tGQ+9gJTne0IYwFEbf+7FMtxp6kOfG1v25f2QijXVxASNLFmm6Xir
 o6APPe5LfGH9KGadmGs5vjsr5UEiZNqAKMHYvwzW1QbDSeuNwdCrpXaAjAaCHGUeZR3ghxrVa7B
 zjX/ZZj2ES5hGZZ6HJD5+vA7t1o6te/0HIpJbR9n8XxjWa2xWpEpYBXedbvALc//XypGakqKz/E
 tfk3cRnRS/t4WUw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

Document the DisplayPort controller found in the Qualcomm Glymur SoC.
There are 4 controllers and their new core revision is different when
compared to all previous platforms, therefore being incompatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aeb4e4f36044a0ff1e78ad47b867e232b21df509..26f5043748c166aa44be4e62445a63106edf9578 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,glymur-dp
           - qcom,sa8775p-dp
           - qcom,sc7180-dp
           - qcom,sc7280-dp
@@ -195,6 +196,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,glymur-dp
                 - qcom,sa8775p-dp
                 - qcom,x1e80100-dp
       then:
@@ -239,6 +241,7 @@ allOf:
             enum:
               # these platforms support 2 streams MST on some interfaces,
               # others are SST only
+              - qcom,glymur-dp
               - qcom,sc8280xp-dp
               - qcom,x1e80100-dp
     then:

-- 
2.48.1

