Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEFD516088
	for <lists+freedreno@lfdr.de>; Sat, 30 Apr 2022 22:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3083410EBD8;
	Sat, 30 Apr 2022 20:53:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF1A10E951
 for <freedreno@lists.freedesktop.org>; Sat, 30 Apr 2022 20:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651350120; x=1682886120;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6jbPuSw3k3iSchP4UYOMtIzdN+2guCWB74XjbgdKQmk=;
 b=U2xI56JngC392/wQAFogyJlvzOL28C8Eed83qS3J4ORg58rzewAJiJyi
 +B5uyG5ZKh6tDOKPoLvgh7jDVaeGBPji4H/e/q77YtIFydvh9FKV+rEvV
 b/PCAn6k8G3riBlL8p9+561S6uIlyz4X51vXj8BAZZEPXksbSD6Gi/fIx
 SG75kGhbEk09o5e11ak7WnrmnKoYD7yYZeC2rcJ6128CPXyQn6nTmCyCk
 uuAMICUh9oaT57RcF2Z8dSaRdhNXx68ncq8e2zRfgIxdwn50hvQPq8qnx
 jqmvRYqpCQak/wMbkwYiLa0JLMSbhDyAfpizA36eB5YHRtwAdgIKsh69D A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10333"; a="264507089"
X-IronPort-AV: E=Sophos;i="5.91,189,1647327600"; d="scan'208";a="264507089"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2022 13:22:00 -0700
X-IronPort-AV: E=Sophos;i="5.91,189,1647327600"; d="scan'208";a="809591388"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com)
 ([10.237.72.43])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2022 13:21:56 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
 by paasikivi.fi.intel.com (Postfix) with SMTP id 9F2D220423;
 Sat, 30 Apr 2022 23:21:24 +0300 (EEST)
Date: Sat, 30 Apr 2022 23:21:24 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <Ym2aRE/CkLsuJYzM@paasikivi.fi.intel.com>
References: <20220429164325.1.I2a3b980ea051e59140227999f0f0ca16f1125768@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429164325.1.I2a3b980ea051e59140227999f0f0ca16f1125768@changeid>
X-Mailman-Approved-At: Sat, 30 Apr 2022 20:53:37 +0000
Subject: Re: [Freedreno] [PATCH] device property: Fix recent breakage of
 fwnode_get_next_parent_dev()
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Scally <djrscally@gmail.com>, linux-acpi@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, Apr 29, 2022 at 04:43:47PM -0700, Douglas Anderson wrote:
> Due to a subtle typo, instead of commit 87ffea09470d ("device
> property: Introduce fwnode_for_each_parent_node()") being a no-op
> change, it ended up causing the display on my sc7180-trogdor-lazor
> device from coming up unless I added "fw_devlink=off" to my kernel
> command line. Fix the typo.
> 
> Fixes: 87ffea09470d ("device property: Introduce fwnode_for_each_parent_node()")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Good catch, thanks!

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> ---
> 
>  drivers/base/property.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 36401cfe432c..52e85dcb20b5 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -600,7 +600,7 @@ struct device *fwnode_get_next_parent_dev(struct fwnode_handle *fwnode)
>  	struct device *dev;
>  
>  	fwnode_for_each_parent_node(fwnode, parent) {
> -		dev = get_dev_from_fwnode(fwnode);
> +		dev = get_dev_from_fwnode(parent);
>  		if (dev) {
>  			fwnode_handle_put(parent);
>  			return dev;

-- 
Sakari Ailus
