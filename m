Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644247572D4
	for <lists+freedreno@lfdr.de>; Tue, 18 Jul 2023 06:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16BD10E066;
	Tue, 18 Jul 2023 04:34:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450E110E062;
 Tue, 18 Jul 2023 04:34:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6247861375;
 Tue, 18 Jul 2023 04:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0065C433C8;
 Tue, 18 Jul 2023 04:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689654840;
 bh=pixKIFpANj6Pob0ssMruoTOTrgPNBkZB51oMfPdOR3U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nCjHCLsmQGC2ppqJZN+sGubkWUB2hIFxepN31uEUnsthLLxOO6wvrsdiZ7THEA9xv
 HIH8Z7Q4qs2+c2H/osqdRQXhiCKVZ4flMAYgdN0jHGo51X7DkfZIQ7nDY4hfd+L59j
 8IYhexuMElrfRc8OjQ/XlxrH3gY3WLv4GZdCNvtWHuT/5LBdK/O8dONzytmgjnVYuj
 E7GOy3OxMSOyHjcryM6aS0WnD48jQPO6kFameFgrIC/DO6yF9WGpl5pY6bvSXGHgzU
 aFYBrU+AUZMw3CK5w5IgkpYvgZje1ur8NutXXqdrBmo5seNDu4BK9NAzxyjf3F1+1S
 VPetXFXbqz9RA==
Date: Mon, 17 Jul 2023 21:37:24 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <yjr3i54z4ddifn7y6ls65h65su54xtuzx3gvibw6ld4x27fd7x@ganmrdp4vzx7>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH 0/5] arm64: dts: qcom: qrb5165-rb5: enable
 DP support
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
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, Jul 09, 2023 at 07:19:21AM +0300, Dmitry Baryshkov wrote:
> Implement DisplayPort support for the Qualcomm RB5 platform.
> 
> Note: while testing this, I had link training issues with several
> dongles with DP connectors. Other DisplayPort-USB-C dongles (with HDMI
> or VGA connectors) work perfectly.
> 
> Dependencies: [1]
> Soft-dependencies: [2], [3]
> 
> [1] https://lore.kernel.org/linux-arm-msm/20230515133643.3621656-1-bryan.odonoghue@linaro.org/

I'm not able to find a version of this series ready to be merged, can
you please help me find it?

Regards,
Bjorn
