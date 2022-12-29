Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17042658CC3
	for <lists+freedreno@lfdr.de>; Thu, 29 Dec 2022 13:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BA910E1F2;
	Thu, 29 Dec 2022 12:44:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF1D10E1F0
 for <freedreno@lists.freedesktop.org>; Thu, 29 Dec 2022 12:44:51 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id kw15so44628335ejc.10
 for <freedreno@lists.freedesktop.org>; Thu, 29 Dec 2022 04:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0TFFrUt4LQqfMqFPZcUCojOx9RB3FN3rW7wfQoSwSrA=;
 b=TeL5UAmg/6zgmU3Ix28zmrwTqBsHNJFuE74+7sO8tbSEZvyyync000drkXXuU7p7Qu
 uWs8ItZm1xA60PyUHCQ4vjfgR1btDJlWhhOXEICIjjAByseTXkqiBDiLXuzM0xSHEAPG
 PscC83Wj4yyfgO8RPMXih7sZs+cuK3LU30TzeHlUxLr8PcFcr89x4uzUpAtNHidk4j/4
 X3x7y8dy69BrnH2ecBlszIw+3IZjK6mHfeppnulHSfG9PnIdZjrWDvS6aNAvRNOJXV++
 3yFKJs46Mj3QS6GIEamPrFslAvLRuROgSJs+z7geztMtCTPcDD5mcWCA/PbzaiHl6c3O
 r9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0TFFrUt4LQqfMqFPZcUCojOx9RB3FN3rW7wfQoSwSrA=;
 b=wxHh42VPXSocm41R2wzoY3Xhf9A8X/OQz6KgEpWlMEJY66RJ+CnCm7pgKwqFSuRCgM
 c6OQl7H5Z4+Glj1e4ZEQPG9r2r8k56sp+efPGI3+ysJxnDmoS+0B+lliJH/Jf0xOqxGB
 cvQEB51y6/ql9YBpuVOE/wuIuavoBCgelNNTHZlpB4ag/qfqWZaQ78HMLVr0erufXiXs
 59ZBqHSpikgmc7usV69GDUXL/1De7XiZvYgH+c+FhnF7gytmxhy3YSAejZ8amQEGJ5Bu
 sEdJvrXbIPhsCm6xW5TFPhvTRQAOYxl2Th4RSwtt1voYp+nQ5s8m1poifrMZQoZAPlSK
 ksrw==
X-Gm-Message-State: AFqh2krJ/ZaDi4VAiTMqQnncXoIOA1eMhLK6ndF3l6BvAVtuhquLIbET
 lmugq74fcbJGdaizKgP9nZEqRA==
X-Google-Smtp-Source: AMrXdXssBXJ2oUDdvTt+u35WNx5VyF+QRRodDl/adWaxq1LEm/yYsY4FbIIzuvo6lICBCR3ElLA3BA==
X-Received: by 2002:a17:906:18e2:b0:7c1:4bb:b157 with SMTP id
 e2-20020a17090618e200b007c104bbb157mr30451069ejf.4.1672317889933; 
 Thu, 29 Dec 2022 04:44:49 -0800 (PST)
Received: from planet9.chello.ie
 (2001-1c06-2302-5600-12a8-8cf4-e3f6-f90f.cable.dynamic.v6.ziggo.nl.
 [2001:1c06:2302:5600:12a8:8cf4:e3f6:f90f])
 by smtp.gmail.com with ESMTPSA id
 15-20020a170906318f00b0078db5bddd9csm8483461ejy.22.2022.12.29.04.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 04:44:49 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Date: Thu, 29 Dec 2022 12:44:37 +0000
Message-Id: <20221229124438.504770-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 0/1] Fixup documentation for dsi-phy-28nm
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
 andersson@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, quic_mkrishn@quicinc.com,
 bryan.odonoghue@linaro.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

V3:
Moves change to last item in list so as not to break-up grouping of reg/reg-names

V2:
This is the one remaining patch I had from a previous series for
mdss-dsi-ctrl and the dsi-phy. The mdss-dsi-ctrl set became a bigger so I
split out the 28nm phy fixes.

I'm resubmitting with Dmitry's RB as a standalone.

Old: https://lore.kernel.org/all/20220630120845.3356144-1-bryan.odonoghue@linaro.org/

Bryan O'Donoghue (1):
  dt-bindings: msm: dsi-phy-28nm: Add missing
    qcom,dsi-phy-regulator-ldo-mode

 .../devicetree/bindings/display/msm/dsi-phy-28nm.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.34.1

