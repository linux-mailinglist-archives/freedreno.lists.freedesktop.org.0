Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E02A8554AE
	for <lists+freedreno@lfdr.de>; Wed, 14 Feb 2024 22:24:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D94210E479;
	Wed, 14 Feb 2024 21:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Df4QANPt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B285E10E479
 for <freedreno@lists.freedesktop.org>; Wed, 14 Feb 2024 21:24:52 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-562117d3dbfso2190128a12.1
 for <freedreno@lists.freedesktop.org>; Wed, 14 Feb 2024 13:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707945891; x=1708550691; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uXAA6feqe7ITmVt5QxnaZYVqRK0lZp3lcWFLVwQYYf4=;
 b=Df4QANPtcma2PnY/++f0Sf2xH7+8tmNe1bnC8ERg3lsoOYnOfrxfu1N6EXthLsJTRe
 eoxtGCA8b0C68f+cntRJ/5I103txsvY1kOTVQh4d4qmHBBwWOHGJ/wpI8v0+MQ3Uzk+g
 LTjeqHzTUUajx3N8/e10EQmOi7zw9kixmVrqzD97PMSc5tqIu+icjCXQUDE8heu0ewDB
 KJMPdgN18wuEIt5OQfMIhRIb+R/5Qj9cGKae4Cz02A3AmZ21MnetyBGrm7AB5gSg0iNW
 E7YBFpJd8A4xGIaQZXZkOonoS7BRl2NRYBvpzybOOq057fhLbX91/LyAw6MNWRf4xP+8
 NqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707945891; x=1708550691;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uXAA6feqe7ITmVt5QxnaZYVqRK0lZp3lcWFLVwQYYf4=;
 b=J8xos0LsXcLkQAfbZn8V3SObrsg1UT265uq4wpgIwyXINGGrUEluv4hV3gwgNEjqNj
 tRTKQfJCZvqpUoC1Pf8KW+1v2vgBBKP+lPqX0PK+t9dklm4HDyi+4v6lL+4JMxbjhk18
 FeOWP/9lI1wedHx34QE4ARq4TgP/O8mSh4wg7Q5Kn5e7aoX2weHtUcGsdplKAJ7AIul3
 LnQAUerSRbQH045A6WFo71lJl4sw/P+uJi90aXIhLUNCl0g9qU1YwP9BmMye/DVm53xg
 JX/Tk0kmCD8dgxaz9MUnoWfixai7ajPttMPddXwkSjmKHUvjQhq6Tz6ATXpll4z2SW5L
 6yuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAXMWQ52cNaGBAEux5mRd1HlO+RG+h1vztai6jZrr7Msb4U4hEJ1sgXwp8fuSBXxp9kV2FXrdqzcB+J3zAiRDzXPM+tDSDnQOkQ29lUUgL
X-Gm-Message-State: AOJu0Yx9/LriLOUM4wkij5Gefvd3mWntXAje8NcyakOlveHiURapIiK+
 75IK58Vz8IjILRMGdTHFOAvS5+5AonM+UQ4XAjAS7NMS2AxUl3YS69vykfVx2DM=
X-Google-Smtp-Source: AGHT+IF3YdfiAMlAsriS7KTo5dpnNgm0uvc6GEJADQtnnnPz3NJxhf3kY+qOs+OADKjIypSLqGno4w==
X-Received: by 2002:aa7:c541:0:b0:562:1a77:19a7 with SMTP id
 s1-20020aa7c541000000b005621a7719a7mr3030102edr.11.1707945891017; 
 Wed, 14 Feb 2024 13:24:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXU0qvhrDFreJ4oK2g+L9nd9ACNCWvB7bhwMxZfDHlCfVObh12ic5ACvPwjBNo6WRBIozr/FRupxZgVbmwKWdrS6vOC+0A14cQ0Y3k/wvZEuva9sopvhkzM+SLtupUac4XA6vzvvy/qlNLNFUEiNg9MFe0N4BxBjWptTZXOueN/Tz7qe6caLz+UTUgg4L3SsMWzG4IjYA0/jcbdlL1IxMKG8s2Ol/Fyj16mvMrFoHm99sjzGZaCPOUQHWDoDxRoFVuXngA4Mxp8YAf3/5Cjoyfy6aZ8tEgKxRvL+ei/SWyabNrZ6GcMrlh7JSRaM2D1lWxH08K1BGkGRuNzovN/hlvD+DL5S/4IgD4XZvI5boLjWSXa4aDg5MYnQtqpwqE+2W3Xe01H4WOOKnYWdlQhoPrqC+d+BBvZ3KOvTwRBubwy2DCGqPStgOksEzTYF/v+fmDnBF87KpUb5gAiYN0OWvlXmdeSI/wfGiAvK2Kr29Iq8hNgY0ds/lRnKs4JvEtqzPsIVQPuI3yU2v8npiHd3VyYoWZpPLoYMdUlHPAt25q+cMfIpObffM4aMXbRtg+5M0UK6C4SGnSRuPX7xp76snfCf/HivY1s9yINsyZabQLXTpi4jt1cMGA4oK+jLs8xa0XGhSXiJY6I6mg4/f+Ey2Ty5eWyn3S/J9z/gWPXbJ4+G5sX52zxwIz8x7OG8HFA4e4=
Received: from [127.0.1.1] ([188.24.162.93]) by smtp.gmail.com with ESMTPSA id
 r16-20020aa7c150000000b0056399fa69absm257298edp.26.2024.02.14.13.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 13:24:50 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 14 Feb 2024 23:24:31 +0200
Subject: [PATCH v2 2/4] dt-bindings: display/msm: Document the DPU for X1E80100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240214-x1e80100-display-v2-2-cf05ba887453@linaro.org>
References: <20240214-x1e80100-display-v2-0-cf05ba887453@linaro.org>
In-Reply-To: <20240214-x1e80100-display-v2-0-cf05ba887453@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=848; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=u4L61jxb3pk7DyZvt+6wEP3FQgg6lRJc0FDd03RRCBk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlzS+YTnSq40dkUznjxwa6aCG1BRHC+ieUtvEV8
 SGNKa5dRd+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZc0vmAAKCRAbX0TJAJUV
 ViaEEACcNVWat66Uto6xWPYY6++Hjv/g3VPUnkDooF/v2K8G5glMpa9wUbHB5xUqxjKXpxvt0+l
 us+AcR9eJeukGm2ZQXCiX2yXXFMcoIneLwYMPSkL6FdRNTac3KDnpNI8JEx+jr6hmzC1reyyeRx
 SBM33s1sZSWQXbGEZd0s3NytgfBkdO5b2TE7h72Z0odSF0fq88O5bpoPX23mFCiifSwpzgSekG4
 WNwOsS4iqv6ioHRI4hl+8FMRFyAEIkvSsXAfpCsWZ1cn/wrTTL5oK4avtDE27KkBEn3urnZZIAz
 TXOFd+Jh9sYBs33SZOaFLLSCbp0HhTQ162E8KAKoPI1tZDpReUWdn66f0p+X7l1NFDcGZhIyM7G
 loliKR5JXRmpr0ygJZiPUOxONV4aV1Wb7jcsC5/Hj1DCe6YXjSGIWqjU/4C8N++U6E7FnGH7gi7
 u6ozqw8c3zUVpHhA78Lrz2TPXiZbSDk9e5Her4MTqQKLan2oD2+EKBRGHhltIlIr6zGNPFRkjcP
 tzLtQPihFlVJxAASF0rO881NHqoNC+umPd0UUttpX1BEALENl2KWMu0R7uyAR1kt96Myy22Aeba
 5kc9CGAOQAZXM1RWUVaOIDd9CgPNKZ7LnnZhNyFeIeKkGlVaVylzydoY3zG4tKUps8x3U+UUQUo
 XMKleu5kRR7fL6Q==
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

Document the DPU for Qualcomm X1E80100 platform in the SM8650 schema, as
they are similar.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index a01d15a03317..c4087cc5abbd 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -13,7 +13,9 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    const: qcom,sm8650-dpu
+    enum:
+      - qcom,sm8650-dpu
+      - qcom,x1e80100-dpu
 
   reg:
     items:

-- 
2.34.1

