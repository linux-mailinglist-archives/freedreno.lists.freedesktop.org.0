Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (unknown [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94653F949A
	for <lists+freedreno@lfdr.de>; Fri, 27 Aug 2021 08:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772396E8E2;
	Fri, 27 Aug 2021 06:53:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DB36E8E2;
 Fri, 27 Aug 2021 06:53:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="217911485"
X-IronPort-AV: E=Sophos;i="5.84,355,1620716400"; d="scan'208";a="217911485"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 23:53:38 -0700
X-IronPort-AV: E=Sophos;i="5.84,355,1620716400"; d="scan'208";a="457426240"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.68.154])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 23:53:36 -0700
Received: from platvala by thrakatuluk with local (Exim 4.94)
 (envelope-from <petri.latvala@intel.com>)
 id 1mJVmy-0003UL-90; Fri, 27 Aug 2021 09:56:32 +0300
Date: Fri, 27 Aug 2021 09:56:32 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Rob Clark <robdclark@gmail.com>
Cc: igt-dev@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Rob Clark <robdclark@chromium.org>
Message-ID: <YSiMoK5r1OgrGh3I@platvala-desk.ger.corp.intel.com>
References: <20210825233139.1066504-1-robdclark@gmail.com>
 <20210825233139.1066504-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210825233139.1066504-2-robdclark@gmail.com>
X-Patchwork-Hint: comment
Subject: Re: [Freedreno] [PATCH igt v2 1/3] drmtest: Add DRIVER_MSM support
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

On Wed, Aug 25, 2021 at 04:31:37PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  lib/drmtest.c | 3 +++
>  lib/drmtest.h | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index e1f9b115..29cb3f4c 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -179,6 +179,7 @@ static const struct module {
>  } modules[] = {
>  	{ DRIVER_AMDGPU, "amdgpu" },
>  	{ DRIVER_INTEL, "i915", modprobe_i915 },
> +	{ DRIVER_MSM, "msm" },
>  	{ DRIVER_PANFROST, "panfrost" },
>  	{ DRIVER_V3D, "v3d" },
>  	{ DRIVER_VC4, "vc4" },
> @@ -539,6 +540,8 @@ static const char *chipset_to_str(int chipset)
>  		return "amdgpu";
>  	case DRIVER_PANFROST:
>  		return "panfrost";
> +	case DRIVER_MSM:
> +		return "msm";
>  	case DRIVER_ANY:
>  		return "any";
>  	default:
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 7d17a0f9..a6eb60c3 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -50,6 +50,7 @@
>  #define DRIVER_AMDGPU	(1 << 3)
>  #define DRIVER_V3D	(1 << 4)
>  #define DRIVER_PANFROST	(1 << 5)
> +#define DRIVER_MSM	(1 << 6)
>  
>  /*
>   * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
> -- 
> 2.31.1
> 
