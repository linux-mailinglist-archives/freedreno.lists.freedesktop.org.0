Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EFF790E4E
	for <lists+freedreno@lfdr.de>; Sun,  3 Sep 2023 23:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A0910E222;
	Sun,  3 Sep 2023 21:41:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3AF10E218
 for <freedreno@lists.freedesktop.org>; Sun,  3 Sep 2023 21:41:55 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5007abb15e9so1436441e87.0
 for <freedreno@lists.freedesktop.org>; Sun, 03 Sep 2023 14:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693777313; x=1694382113; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f4CGlwIh3CaiNYfDE8T4/N3NKVw9L1KuLHleXxMGA8k=;
 b=KNA+iMyUQFJUdz/HiCbUktzZqZCX9ilawVn7nJ9pdABcuhwtHH5a9L7GC2Tsqqx026
 9bidKpanLs41y+2KRIqYubg1VHaQZAOaRuvpD8c4S2j+ZguquVtEIraWsqpyN9gv34Lb
 KqhEA7hQ9IAwfEpwMsPIZncyJoMbLYHw5YeJJf6pvKzTUhAIqoN9Vf4Dave/y91g0tU2
 A1YNg9pPGTEMHw6GlW0eR2/kSPA8FzYBCS2OEhS7U+QXIbnAdwWaY6nC71zDSKLnEMsw
 YtdV/YG+fj1Mrd9RRQ59I5/9TK98nD6Sdwx53wmkmjo4rF6k7TzRrQpJu11+0RcmSsB7
 Pcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693777313; x=1694382113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f4CGlwIh3CaiNYfDE8T4/N3NKVw9L1KuLHleXxMGA8k=;
 b=YJYzjkxq8wJYG8sazzdZpl/fyjpIL4BE0i38L2qsZg/HtPI5fVF1w10//Mh/kZYSIP
 XneFpv9SqbkCCau8Z/o7MDsCJdCzyiumOnTnXT/NFI3V5dLhOX++0w+oas4vku1hxdgd
 2GXxGf/qcMTCs0C0r0WWZQUsyGpPaQgDj9DcQyOT12bQoEUzn0uSvODuuvh8lY34ZIcc
 pE9zem2k/HV3vhVi6cQ9//9gWjd0oD2vcisiZjqujdnTsfpIULBAliDC2nUxAKPyIN5+
 giO78PAn/QPu7kVKjLwlnt4AzzAc0N3L+zbMpR2M++xekOp/8wAv30xbp8e5Pxl7dit2
 UMuw==
X-Gm-Message-State: AOJu0YwjU8H3NKbpxteXXailW8cM7KYAvMvGLzqWjz+Zy1CqB1yO+IB+
 UEoxzKto7N5WB4yg/SL5zlzNAw==
X-Google-Smtp-Source: AGHT+IHZcZHwPmZz/G9GJYrJdaFt/yh7kFkMispc1XECmMNIp6Mo7eyJQIJfgGNG8gZdXS8BoslEpA==
X-Received: by 2002:a05:6512:3444:b0:4fb:911b:4e19 with SMTP id
 j4-20020a056512344400b004fb911b4e19mr3890157lfr.35.1693777313473; 
 Sun, 03 Sep 2023 14:41:53 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x17-20020ac25dd1000000b004f8555f7aa1sm1422506lfq.52.2023.09.03.14.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 14:41:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Janne Grunau <j@jannau.net>, Simon Ser <contact@emersion.fr>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon,  4 Sep 2023 00:41:41 +0300
Message-Id: <20230903214150.2877023-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v1 03/12] drm/connector: extend PATH
 property to covert Type-C case
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
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Userspace needs to identify whether the DisplayPort connector is a
native one or it is wrapped into the USB-C port. Moreover the userspace
might need to point user to the exact location of this Type-C port on
the laptop case.

Existing USB-C altmode implementations (i915, amdgpu) have used the
DRM_MODE_CONNECTOR_DisplayPort even for such ports. To keep backwards
compatibility we can not change this to DRM_MODE_CONNECTOR_USB.
Therefore the kernel needs some other way to represent this information.

To facilitate this, reuse the 'PATH' property, which was used to
describe the DP port in the DP MST configuration. Use either
'typec:portN' to point out to the Type-C port class device, or just
'typec:' if the corresponding port can not be identified.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_connector.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 05fc29a54801..a326782e936e 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1185,10 +1185,14 @@ static const u32 dp_colorspaces =
  * 	never read back the value of "DPMS" because it can be incorrect.
  * PATH:
  * 	Connector path property to identify how this sink is physically
- * 	connected. Used by DP MST. This should be set by calling
- * 	drm_connector_set_path_property(), in the case of DP MST with the
- * 	path property the MST manager created. Userspace cannot change this
+ * 	connected. This should be set by calling
+ * 	drm_connector_set_path_property(). Userspace cannot change this
  * 	property.
+ * 	In the case of DP MST this is equal to the path property the MST
+ * 	manager created. It is equal to 'mst:baseID-port-port...'.
+ * 	In the case of DP USB-C connector this is equal to the 'typec:portN',
+ * 	pointing to the corresponding Type-C port device or just 'typec' if the
+ * 	corresponding Type-C port can not be identified.
  * TILE:
  * 	Connector tile group property to indicate how a set of DRM connector
  * 	compose together into one logical screen. This is used by both high-res
-- 
2.39.2

