Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 683E8784269
	for <lists+freedreno@lfdr.de>; Tue, 22 Aug 2023 15:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2642D10E36C;
	Tue, 22 Aug 2023 13:51:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDE210E36C;
 Tue, 22 Aug 2023 13:51:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA28A61A6A;
 Tue, 22 Aug 2023 13:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D52DC433C8;
 Tue, 22 Aug 2023 13:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692712272;
 bh=eNJ1ArCqNfDsBkko0rVolZfY4UgGf4CCVx88itGrCnw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oy3NM4aapbcthQupb6Wm6LrjFaAYu6eNbEScDHGjGQcGoquI3t1j3wrpzY/39j1f0
 k824I6VSQB5FRQIiXT9vjs0gOMHMpPxrKORx3ogRQB22SkPONdxLFMRwyttaxC+8Py
 /gY5g/+6jaSoxJ0Ht0yxsD2wcrDyMe9dE5v7iN0epWTNFCq1hRmqPIbzM7I1YXzacT
 kj71yI21OzXtBju9xYk65XVAsgQ00sSJCsDAk7ihqMsRjigyxMJLSWd/aWh5Ul3tS4
 xKS+RDG9XL++zpnUssbvyWD4pzkFMDwsn+SWxexVPOD+HVpgw/ia0BEViqqhRcEEa3
 g0tpZDF9aCORg==
Date: Tue, 22 Aug 2023 19:21:07 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <ZOS9SxQTWcKM+CBa@matsya>
References: <20230817145516.5924-1-dmitry.baryshkov@linaro.org>
 <20230817145516.5924-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817145516.5924-3-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v4 2/3] phy: qcom: qmp-combo: switch to
 DRM_AUX_BRIDGE
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Robert Foss <rfoss@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 17-08-23, 17:55, Dmitry Baryshkov wrote:
> Switch to using the new DRM_AUX_BRIDGE helper to create the
> transparent DRM bridge device instead of handcoding corresponding
> functionality.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
