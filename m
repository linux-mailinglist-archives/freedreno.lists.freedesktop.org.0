Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FIQuDDRlrWlp2QEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sun, 08 Mar 2026 13:01:56 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E782300F8
	for <lists+freedreno@lfdr.de>; Sun, 08 Mar 2026 13:01:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F02710E121;
	Sun,  8 Mar 2026 12:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="FFzDtZuY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6B510E121
 for <freedreno@lists.freedesktop.org>; Sun,  8 Mar 2026 12:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g77KuUu7tZV2EWc/eRT4uXRlFQCkO7bU5cTH+0cVCG0=; b=FFzDtZuYkC0DnUyz163rl2C0J7
 BlNREDfLbFSqsCDGG7wyqYQIkW9dVN3DggsHpt6BqHwHaaJCJYr5hlnQvXRkPPQ41ar85DzFhMEmB
 gFC6oC5eK9H+7BsTfL2Qaie+4PSNMBteqELve/Q0cUSwwEHPGq6uEDlwML0R5lJ8E5ebW00T/Vzut
 DuJXep+nuwECH8QlUkCKWVPiRO/PGZMUciO0bD5lSEzEqQr2CySIpJWpeB2FiLZRSgN1aKy5u1pjb
 388/H2D8TPVbJxV+5QHfwZsd8BBR1NJAj5Afn5lTxCrADySNQUKbR+nvc2uheAu2RvUMjRHBcPj35
 vAoAoQ0w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57616)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vzCpK-000000002nH-1IFO;
 Sun, 08 Mar 2026 12:01:42 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vzCpF-000000003JS-0B1B; Sun, 08 Mar 2026 12:01:37 +0000
Date: Sun, 8 Mar 2026 12:01:36 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: vladimir.oltean@nxp.com
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH v2 phy-next 22/24] phy: include PHY provider header (2/2)
Message-ID: <aa1lIBO3j_apIPjb@shell.armlinux.org.uk>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
 <20260308114009.2546587-23-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308114009.2546587-23-vladimir.oltean@nxp.com>
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
X-Rspamd-Queue-Id: 90E782300F8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vladimir.oltean@nxp.com,m:linux-phy@lists.infradead.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-can@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-ide@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linux-usb@vger.kernel.org,m:netdev@vger.kernel.org,m:spacemit@lists.linux.dev,m:UNGLinuxDriver@microchip.com,m:dmitry.baryshkov@oss.qualcomm.com,m:shawn.lin@rock-chips.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,freedreno-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.053];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 01:40:07PM +0200, vladimir.oltean@nxp.com wrote:
> diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> index 5b1c82459c12..4f8ffc6524ab 100644
> --- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> +++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> @@ -7,10 +7,11 @@
>  #include <linux/ethtool.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  
> +#include "../phy-provider.h"
> +

As we know, this will conflict with my patch in net-next. I guess Vinod
hasn't (yet?) merged the commit that Jakub provided.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
