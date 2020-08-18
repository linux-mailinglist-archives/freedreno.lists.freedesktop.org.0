Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C39C724907B
	for <lists+freedreno@lfdr.de>; Tue, 18 Aug 2020 23:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453EA899D4;
	Tue, 18 Aug 2020 21:59:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F84289A34
 for <freedreno@lists.freedesktop.org>; Tue, 18 Aug 2020 21:59:37 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id r11so10617919pfl.11
 for <freedreno@lists.freedesktop.org>; Tue, 18 Aug 2020 14:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=LBK59hoC/QeRiJTHTK+5CDgO+Kpr6UH6snOINOdNcEc=;
 b=dOK2BsUAC+X5cn4UBcaTivDHVHteQhdCDednUL3JgbPE0LOySnHHNp+kxYp4Lv5hFv
 OZtGYvKkoFMin6uNX1fpS5sMdOvPh43Y+szX4VYbJ3utQ2drqua2Q3lYg1+/t+WC0OSP
 Vr0/W/jEqyXLCcSw9VpAABGrGf+ZxjFwXWtYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=LBK59hoC/QeRiJTHTK+5CDgO+Kpr6UH6snOINOdNcEc=;
 b=DOruSdZUHg4ihSyxHMxVB+5N6Rnat8oWxOwWvG3nMs874mfVroJAa7jkZ2aIvFqaSr
 putKWwKcoxaz8l8XUfNgTh+yuxUl/7XXw9NQ0VdtZYca1UIyrsaRxqImTl4hQpZFt5fs
 PSs0O163Ya3e2VHgKO55GhjBe1LgVwsJ6PYzKLA27mK0SCmaNK2Grh2DDEnaNTNjkzOI
 UX3asJ7x4zIOXEcwyIkurn99jsz/VYiDdPN5TrLJ4hwE54StCYz+J6CB4l89SRT1RZNO
 27AKBrnqqGcK3aWgMc/JfHAjO/RwnUFyDRJYLByySXhaL9t1wfTFwGIMSWaPs2BUBmJV
 eeIw==
X-Gm-Message-State: AOAM531KcLtVxpCO4eRuMopgfbnc07kv8fDYPcFnvDjoL1bSZ2lEsitw
 xu4Ri2Q2AByIah01YoAdq3jFwg==
X-Google-Smtp-Source: ABdhPJyS57EcdCietirtZsste3Gi4BbiPyYRBoBbKZ4T/VQNq4avYwEZDBCDdLGtQZOv+9ZD6nUmKQ==
X-Received: by 2002:a63:ab43:: with SMTP id k3mr13655112pgp.426.1597787976692; 
 Tue, 18 Aug 2020 14:59:36 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id x28sm26049746pfj.73.2020.08.18.14.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 14:59:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200818211546.559-1-khsieh@codeaurora.org>
References: <20200818211546.559-1-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Tue, 18 Aug 2020 14:59:34 -0700
Message-ID: <159778797494.334488.5009772006048435758@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH v3] drm/msm/dp: Add DP compliance tests on
 Snapdragon Chipsets
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 daniel@ffwll.ch, Guenter Roeck <groeck@chromium.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2020-08-18 14:15:46)
> add event thread to execute events serially from event queue. Also
> timeout mode is supported  which allow an event be deferred to be
> executed at later time. Both link and phy compliant tests had been
> done successfully.
> 
> Changes in v2:
> - Fix potential deadlock by removing redundant connect_mutex
> - Check and enable link clock during modeset
> - Drop unused code and fix function prototypes.
> - set sink power to normal operation state (D0) before DPCD read
> 
> Changes in v3:
> - push idle pattern at main link before timing generator off
> - add timeout handles for both connect and disconnect
> 
> This patch depends-on following series:
> https://lkml.kernel.org/lkml/20200812044223.19279-1-tanmay@codeaurora.org/t.atom

There's a v11 of this series. Can you rebase again?

> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> Signed-off-by: Guenter Roeck <groeck@chromium.org>
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>

And fix this SoB chain to be proper with Co-developed-by tags and your
tag coming last as you're the sender of the patch.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
