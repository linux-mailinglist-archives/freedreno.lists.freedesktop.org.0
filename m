Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA7956696D
	for <lists+freedreno@lfdr.de>; Tue,  5 Jul 2022 13:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A680C10E7B1;
	Tue,  5 Jul 2022 11:30:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A9610E021;
 Tue,  5 Jul 2022 09:07:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 82CDDB81646;
 Tue,  5 Jul 2022 09:07:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1242C341C7;
 Tue,  5 Jul 2022 09:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657012023;
 bh=3ZpJpRNDhK6kBwRF3RuYIOFq7v3/dbRfERHQO2XKC9s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oglNQPqxphZHLSarXFIjRthMAFo/TsafAbm8rCG2BW4lSzJbXrFPGqILs8tdQYVnM
 GpJzRjgiVgviHw11UOsQ+XRjqjARbK9mbrQKyp9qA+ZoXus6l4+eXvzmbdHZNGS4en
 mFF3ETc27nnx0OuFnYTify3H+qKlJJahQZNRHh607EXDyNTbkCQ0T/srH2zWFtCvhU
 smcQ+18wH7JFxBWq9i7pNdjLf3RDI1RFKQt1GKE6C8dSrNMWenenQ1j1WCkg4iHCPJ
 /6aUKcr/DBCRKrO4RzOzbGdwlkvoJNOxEiCLRt+U1p4DnMwp5hM7rgenEiud91p3BA
 a863LznbMhSpQ==
Date: Tue, 5 Jul 2022 14:36:58 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <YsP/MmX96aIYc1p7@matsya>
References: <20220617103608.605898-1-dmitry.baryshkov@linaro.org>
 <20220617103608.605898-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617103608.605898-2-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH 1/3] dt-bindings: phy: qcom,
 hdmi-phy-qmp: add clock-cells
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-phy@lists.infradead.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 17-06-22, 13:36, Dmitry Baryshkov wrote:
> As the QMP HDMI PHY is a clock provider, add constant #clock-cells
> property. For the compatibility with older DTs the property is not
> marked as required.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
