Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D567279D4B
	for <lists+freedreno@lfdr.de>; Sun, 27 Sep 2020 03:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842376E07B;
	Sun, 27 Sep 2020 01:27:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF966E1E0
 for <freedreno@lists.freedesktop.org>; Sat, 26 Sep 2020 13:34:05 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w1so5363098edr.3
 for <freedreno@lists.freedesktop.org>; Sat, 26 Sep 2020 06:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6Pw2334Ivc2sWGxKj6eRmrpO/w0k8YeD1ECz1yaBwKM=;
 b=BvqFeVCotSaqa7RGGS0JmscAfUY4RysnR3noNuQ3CDIuwAQthuf73oQd5AnU38gOJG
 4BsgP817p2kpk34hBPQrjrr7/ZSfRjxrgaT3TbWcZyV96Bs5M/OrX+jVs5xjOadvZP79
 Ih23VWkferfUeCcUBZcAtpC2H+9xgnaN+jmbdGbsJxVRr8QL+pVmcev4xHpG0gMqKoR7
 1A294MxjJ4dnxCFnS0Hdf9yVnPx5J6Am2us2JR20ojMeXgMZQwtBu9//l27cMezMTLfn
 UJcjlQL2Nsk50umNhwcgb+2OqhTyYWhG83D+rm1uuf+Gtk+MPPmsxgE+dfzS0aU6ZrOi
 4e2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Pw2334Ivc2sWGxKj6eRmrpO/w0k8YeD1ECz1yaBwKM=;
 b=V7i+A0tNPJo3xYkHJgBDLVb3HRnIfCnw+z+KwzLdINI5bCorQe24pxc4xH20wOOs89
 H+lAtLmPW99uomckTwXtFe7E711I95U3hDNniyflopsdxJgLZ1zgZ9ILa3q1sWcbgkm1
 PJgr3uNKvrZenBq0AITVP+1VCf/xJlb1WeZ3Ia5c2GR04GncTL7OaoR0i5Mp9rC9THtB
 tqN4wKrCxnEttUZZWPbzXrIvI8+PQAA47cPiT2LKbXizPt6yaLhmJJphaHUBY8W6U4Gn
 G7qHRY4MgICRq7iwYl0J7Ig6jAq2g/wZD+9301biqqYFE9yimudqudpoIgGAVb9ZTO7J
 Jfww==
X-Gm-Message-State: AOAM5338qJTpxAnHXUyfG2lyWLjDgrkOkIfD7AwtJ3EaQ7Maheai1Eby
 AHCOkD8c53RBykrbMpgQ3l+U6mU4wPVHjfrWASo=
X-Google-Smtp-Source: ABdhPJyrAgk1BkT1xIWuRM+4Hpv0cVYqQJRI/0RSH/uVvHjLGYd+gzUDaIx9EfToeqsk3WWxEQy+QGfRWF3zjohMSEQ=
X-Received: by 2002:a05:6402:17fc:: with SMTP id
 t28mr6628569edy.244.1601127243771; 
 Sat, 26 Sep 2020 06:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200926125146.12859-1-kholk11@gmail.com>
 <20200926125146.12859-4-kholk11@gmail.com>
In-Reply-To: <20200926125146.12859-4-kholk11@gmail.com>
From: Martin Botka <martin.botka1@gmail.com>
Date: Sat, 26 Sep 2020 15:33:52 +0200
Message-ID: <CADQ2G_Hk9HweukaYd29JXi_3hxpVTLkcu-3F8qJEZL9h0yrPSw@mail.gmail.com>
To: kholk11@gmail.com
X-Mailman-Approved-At: Sun, 27 Sep 2020 01:27:52 +0000
Subject: Re: [Freedreno] [PATCH 3/7] drm/msm/a5xx: Add support for Adreno
 508, 509, 512 GPUs
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
Cc: freedreno@lists.freedesktop.org, marijns95@gmail.com, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, jcrouse@codeaurora.org,
 Konrad Dybcio <konradybcio@gmail.com>, robdclark@gmail.com, daniel@ffwll.ch,
 phone-devel@vger.kernel.org, sean@poorly.run,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Tested on Xperia 10
Tested-by: Martin Botka <martin.botka1@gmail.com>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
