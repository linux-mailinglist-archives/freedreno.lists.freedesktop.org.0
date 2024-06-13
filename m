Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABCA90794F
	for <lists+freedreno@lfdr.de>; Thu, 13 Jun 2024 19:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A7F10EB3B;
	Thu, 13 Jun 2024 17:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ykcjA7XS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655DE10E217
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jun 2024 17:05:09 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52c84a21c62so1532562e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jun 2024 10:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718298307; x=1718903107; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gzTYGEU1DhC3R38BWXEj7wHUlVjFlaRkpbDFC+I05+8=;
 b=ykcjA7XSFaq3xpJgMamgRgjHClI/gn492FLa2gVj1sNZ+ZYwxUaISYGlcAFyQN+e5t
 CJ7Q7ZKWhWD/BlCLnuSyYsvNnstpDDBfVjCDN+8sm5gsNoaWOfFBd4Lp2oZSqtzX9hEW
 pGBhcxC7l4cYiez/tFwmr0SsKYGDjeX3NAweuu4ZjgSt9XZugsZ8IAfuvQUZ8Tadoy3d
 G82FbIfx1OiVn/K/DOYh2HPX7R7ye5uyb4Vl0Om08O9BYS8cglElFOPryqN4q+W/t51q
 4tC5/viTldLJb868nlYAk7YECqz2iqJp39l43z7F6xeVERUTReOFaMzJwPVJ7Gr5B3CL
 NvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718298307; x=1718903107;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gzTYGEU1DhC3R38BWXEj7wHUlVjFlaRkpbDFC+I05+8=;
 b=hcd2lkNeLABNggdvtz2O5qnKcmASdrJCV64KwvrrkniZr+WmhdFzMq4/Q4+5hl0Yeq
 jFyX05BwyJvZBGFskWBtP4xQ8Q1XcPu/CgCVFJPMks6R0OPOQLZewzGv2aT/vroU1UAc
 8lTAqjvsWgeY6KsBtiVvmnam+afmedt7nS0s/o8R0a16Zm0HipFxfUlokrWAzUUcfphS
 EVgV4Kd8uqoGOjQ1mBfWcwJasOyeowaiLblEx6GH2KbDTgTQ8KhDuk3QVbSXGb1euocx
 02DfE1KR2IgWSf0Ws/hYThie5JIqq4rF469690k4h2NVEenSg5asNM1Y2SQTyArCi/Is
 BMEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjwEZqw/rdVYMFLgcRynlu2e3QBaL7CAQFLp+zeVKkHNH+JeOq0nDCPxVKl6OBCs6M/LzcZ9LNBGk7S3EG7x/VXcLgB8VonbxT2CDurvem
X-Gm-Message-State: AOJu0Yw6QQUr97lY3zPpvLJwJErt/nI5Vnp9SEH4Hrt2D3KVYHhFp6XU
 P+WgOiTQuSjvJToc8Tk7OiXmYGAmpB6Q0rqSh6TbXacLsUfdqsGYnAr3m/oPce0=
X-Google-Smtp-Source: AGHT+IFsJ0kgv2wUPm1EVV4W2U6CcT3UwOe5fdISUs+9DgB+2yyUkjBcEcAJNtWC7OWzuRYFnRGWaQ==
X-Received: by 2002:a05:6512:3a3:b0:52b:c29a:7493 with SMTP id
 2adb3069b0e04-52ca6e6db76mr218800e87.33.1718298307487; 
 Thu, 13 Jun 2024 10:05:07 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2825733sm287312e87.60.2024.06.13.10.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 10:05:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 20:05:04 +0300
Subject: [PATCH v2 1/8] dt-bindings: display/msm/dsi: allow specifying TE
 source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-dpu-handle-te-signal-v2-1-67a0116b5366@linaro.org>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
In-Reply-To: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2033;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=lOztwQqxwser2C8oxS+R98xLg5ISzwcYa6ufdiD2kmc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmaybAqgkrnin4QPjy3QrfpV1tvo5dj5wvvje1+
 di4KHrNe9WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmsmwAAKCRCLPIo+Aiko
 1ZbiCACpMTTnYBZ9Mly4AKpccd8ZUe5WsqowDdq/s0dEF0vhSjjtCrY+ssyP6Ad52y/F8+QGkVP
 RUGTUjgH54tglXZpcAggENVu9MP79YVLjxpVPjX2ofb+jPNhzHtVF6rJAOctRuzwssGRLmLD28g
 0EltbC+Zx029PlsTDHDx2sSW47JhvS7lbk1NaolZg3AbE+Ct+ZvwqM7u0EiV94/lIj9SIXPWwOX
 RJkNERZ1oHG/LdzQK8UCVw4rAuuhQIXki8sSIhyTdGJ1qaPiq8x6a3fop5GnznskkhTGwH6ky7O
 +wxpiNdriDpB//XHeUk3Qe/licV7b15ixd3YNCi6Sso+HYGy
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Command mode panels provide TE signal back to the DSI host to signal
that the frame display has completed and update of the image will not
cause tearing. Usually it is connected to the first GPIO with the
mdp_vsync function, which is the default. In such case the property can
be skipped.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml       | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 1fa28e976559..e1cb3a1fee81 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -162,6 +162,22 @@ properties:
                 items:
                   enum: [ 0, 1, 2, 3 ]
 
+              qcom,te-source:
+                $ref: /schemas/types.yaml#/definitions/string
+                description:
+                  Specifies the source of vsync signal from the panel used for
+                  tearing elimination.
+                default: mdp_vsync_p
+                enum:
+                  - mdp_vsync_p
+                  - mdp_vsync_s
+                  - mdp_vsync_e
+                  - timer0
+                  - timer1
+                  - timer2
+                  - timer3
+                  - timer4
+
     required:
       - port@0
       - port@1
@@ -452,6 +468,7 @@ examples:
                           dsi0_out: endpoint {
                                    remote-endpoint = <&sn65dsi86_in>;
                                    data-lanes = <0 1 2 3>;
+                                   qcom,te-source = "mdp_vsync_e";
                           };
                   };
            };

-- 
2.39.2

