Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 109554BD8CF
	for <lists+freedreno@lfdr.de>; Mon, 21 Feb 2022 10:59:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9DF10E73E;
	Mon, 21 Feb 2022 09:59:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631EE10E5E0;
 Mon, 21 Feb 2022 09:59:50 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id BE27B58025D;
 Mon, 21 Feb 2022 04:59:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 21 Feb 2022 04:59:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=IFVgN74my049bXBhIl0zeRDWJiwGrn
 qHIa/jttdk6C8=; b=mjP/vzgr7CkR825BFfYTstyO3TNWupa759b0oxo9ddH1+S
 8Hi3LX4JzduGBi6Ej2f7ilLpCIv/K3jZX2VJpH43sfHqHYdBQ1RqMzw9r2aASeFn
 CFYAQ3f6hNSpTr8IvwcO2lNfE6+Y4ZegoFikCopYoPbAkTg0c+55JyA041Qc+C+B
 I5LPCV3yPlyIAx7qTNb2ZElBXECgfSEcwt/ZYhM4pqV+3LO5MG/lGdB0KbjSDgh7
 cyRRZ7sDqI5p58ELfyUj2N7lmYGFuj0zSt4/JoywS/jf3z9Z2VKkZnzJiEbZIEQz
 16pcvLfO1rfDVcfJHTYkS/Y8LdP6oa19f5Blfcuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=IFVgN7
 4my049bXBhIl0zeRDWJiwGrnqHIa/jttdk6C8=; b=HlkaHMw5S+3ZAiomMF1kss
 XXNYo0UhUcdR/p8BeUvRbw5Zubkikn+MZQBRr6/xKEd8T4XFJ6UAVqxaUiTNJzR1
 gaboinynA8fFNDRJv+7ORd0RoNkvkXtsnp28EgD9WAsoOFcJmq938vP6E1xylwR2
 rWNcqRy0v6VSNJ/EOZF543F3bC/Ygn948QgTMUOHKYntvYiWRfk95RwzIeoTSEtB
 OhQsdSs5A4R3R5OTlUsXRrDhIaro8hl/RwVefxD3diYSZRVn/UFk4S2cUpKmwf62
 LSzBdN0Xt1gg3lWYkcq80mLVny+kzR+PLbeYv8hdbnuyjgD9jEJAb/bCRg04rTBA
 ==
X-ME-Sender: <xms:lWITYv6FRw1d3IQ8xC0-xm-pZCayZaqjIS3TIMtmN8dgOq88KnKGRQ>
 <xme:lWITYk5d9PsF9dwnkWmhh8OcjAeSQcgCosO9OSWKBDcO7wKaBWrxzHPP1SvEfqLPl
 kYNZMgNOYSR2ADs_LA>
X-ME-Received: <xmr:lWITYmcmKHLtOef4-8ZCz0FjZbseHrdZGHXizmvkA7NI8M9FXLKj_IQ0lzMjgIb27T2Z3DMkDCKyA4LzzGqFpuBVFbrt-HkXPH5zR5o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:lWITYgJQcKsPWICaPaU5dvZ8q8gEPOgDlulqa5y_VoDXQPMKYRKFaQ>
 <xmx:lWITYjKhz6AlcD88sdF5Q-JAJ12w0rEQudFhP8u8jF6SyV5ncBo5lQ>
 <xmx:lWITYpwqOXoKrdC39BujsezgdOiHFTXJjmzjh5rOn1KR2-kX8xPr6Q>
 <xmx:lWITYljHZRb61TPci2afQlOMwPE6h3zGN1uzIhSmuFG7aNsXjwbVNQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 04:59:49 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Date: Mon, 21 Feb 2022 10:59:08 +0100
Message-Id: <20220221095918.18763-13-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-1-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 12/22] drm/msm/mdp5: Remove redundant zpos
 initialisation
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
Cc: Sean Paul <sean@poorly.run>, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The mdp KMS driver will call drm_plane_create_zpos_property() with an
init value depending on the plane purpose.

Since the initial value wasn't carried over in the state, the driver had
to set it again in mdp5_plane_reset(). However, the helpers have been
adjusted to set it properly at reset, so this is not needed anymore.

Cc: freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index c6b69afcbac8..5d8ac84c510b 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -48,6 +48,8 @@ static void mdp5_plane_destroy(struct drm_plane *plane)
 static void mdp5_plane_install_properties(struct drm_plane *plane,
 		struct drm_mode_object *obj)
 {
+	unsigned int zpos;
+
 	drm_plane_create_rotation_property(plane,
 					   DRM_MODE_ROTATE_0,
 					   DRM_MODE_ROTATE_0 |
@@ -59,7 +61,12 @@ static void mdp5_plane_install_properties(struct drm_plane *plane,
 			BIT(DRM_MODE_BLEND_PIXEL_NONE) |
 			BIT(DRM_MODE_BLEND_PREMULTI) |
 			BIT(DRM_MODE_BLEND_COVERAGE));
-	drm_plane_create_zpos_property(plane, 1, 1, 255);
+
+	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
+		zpos = STAGE_BASE;
+	else
+		zpos = STAGE0 + drm_plane_index(plane);
+	drm_plane_create_zpos_property(plane, zpos, 1, 255);
 }
 
 static void
@@ -91,13 +98,6 @@ static void mdp5_plane_reset(struct drm_plane *plane)
 
 	kfree(to_mdp5_plane_state(plane->state));
 	mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
-
-	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
-		mdp5_state->base.zpos = STAGE_BASE;
-	else
-		mdp5_state->base.zpos = STAGE0 + drm_plane_index(plane);
-	mdp5_state->base.normalized_zpos = mdp5_state->base.zpos;
-
 	__drm_atomic_helper_plane_reset(plane, &mdp5_state->base);
 }
 
-- 
2.35.1

