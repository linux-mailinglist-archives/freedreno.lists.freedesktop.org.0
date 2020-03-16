Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A31291870C1
	for <lists+freedreno@lfdr.de>; Mon, 16 Mar 2020 18:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F566E489;
	Mon, 16 Mar 2020 17:00:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309F16E489
 for <freedreno@lists.freedesktop.org>; Mon, 16 Mar 2020 17:00:23 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id z65so10266605pfz.8
 for <freedreno@lists.freedesktop.org>; Mon, 16 Mar 2020 10:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YjH5MjgZiWD2AsCPzj7RL36rRlVP+ZNEC4uN51b8qdI=;
 b=K7kVjtB+7y4URjn4G1hvdMzn78WcrIP9Oz7RSUfwUDvU/XnO2byPqav/Is3jiUWUkB
 W86Xg8p06VavshPMBHqPziU3vXTiy7N48VTAL2j/s2lTWb9lq92j1IU/quTDDTv6S2fu
 DEgpMw1cMNqIxgev0hk/hR3tQhU9JDTDTTbyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YjH5MjgZiWD2AsCPzj7RL36rRlVP+ZNEC4uN51b8qdI=;
 b=QtTtVJWWQ3577J5oPxyyy5yarkgBS87h7tOV7eDrRyZudXBhTIpGg27t1MIQCz9w7I
 qrCuOOXQJdscPid4qWHXwoDKyNhy9iCfYujhgQ+707oqn8Cq7dnsdafywKsVDDiNWj5c
 5WeEgvnvSgHxbEBz3GLXLuac53gjKTfBv6LO2H/WFMxFG0tJ+i23mmn8CKREyJHvGQ5I
 hR22EkQjtu8JkG6jvwIh70BLgC3Dr/KyW4gjdwJ9gE1XHN7vDBNlMAebegQ7VNEzFtio
 EVA4kEcpo47Tmmn0tBn9ECv4d1EBoe2xf6CO1aHmWMga8ORqIFEpMM2WkNsFCuEJeLf8
 ELVw==
X-Gm-Message-State: ANhLgQ3s7LT/uIwMSfVOwH5jJ+rr2lFwnBUOLT67fZa+6ADrgwTQkCY3
 FexdnnwHTS71bsOIMYzrxSCemQ==
X-Google-Smtp-Source: ADFU+vv9s0qOxourNNI2GtsjQWv3rsuzY2mQKW8R2dZ8kWjwvGLWsHZAnNuynD6l0oAx3VizaNsAAA==
X-Received: by 2002:a65:678e:: with SMTP id e14mr669453pgr.299.1584378022722; 
 Mon, 16 Mar 2020 10:00:22 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id u126sm407308pfu.182.2020.03.16.10.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2020 10:00:22 -0700 (PDT)
Date: Mon, 16 Mar 2020 10:00:20 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Harigovindan P <harigovi@codeaurora.org>
Message-ID: <20200316170020.GO144492@google.com>
References: <20200316041647.27953-1-harigovi@codeaurora.org>
 <20200316041647.27953-3-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316041647.27953-3-harigovi@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Freedreno] [PATCH v7 2/2] drm/panel: add support for rm69299
 visionox panel driver
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 09:46:47AM +0530, Harigovindan P wrote:
> Add support for Visionox panel driver.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
