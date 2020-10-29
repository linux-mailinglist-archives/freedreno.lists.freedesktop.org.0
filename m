Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D98929F668
	for <lists+freedreno@lfdr.de>; Thu, 29 Oct 2020 21:48:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FBFB6E900;
	Thu, 29 Oct 2020 20:48:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6724B6E900
 for <freedreno@lists.freedesktop.org>; Thu, 29 Oct 2020 20:48:44 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id g12so3331227pgm.8
 for <freedreno@lists.freedesktop.org>; Thu, 29 Oct 2020 13:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7jTNHive/FLwf9ZZT3i6CSw/O2mDxcoGdERzu325nls=;
 b=S1eLSOvxPle2SWTXmcWkjdxAG8gKeMEQNERefUSZtQOj35IZKWi6zQ3XA/x7yozwz8
 SuJqxRhbB4i6YZ/pUVv4PdoQ6A/WOXxwmF1BPT1/90DX/CA1WzuJ0SBOp9PqwSiCKXSH
 F0G3QbbwVleLe5Wk2wNrW1vW/731JkCOacLvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7jTNHive/FLwf9ZZT3i6CSw/O2mDxcoGdERzu325nls=;
 b=ubuZRsm9wom3ihts67yuFHbuitXNZvGs+8uFvd+QS3RzWHlQGkfHkwUo0CHgaHW6g0
 QsX2VXnDJCDWWVqHrszInoX3DLUVGriVChI1/vQ1I/AzwYb51yWkOPl+rqXDWVqM3O9k
 g8H2IMotGgLjx8EaEY0JF73BY/0jidwXTIi5EazgCmfXnKc0FsqCBPVrArLoN3t3lu0N
 OhbYewTYlXjjTnfUbMFolaVLOWZOeQ7MHDXmu2hua6bNaP2VxZH519AL+b9/uY/8IS7p
 bvmQfQndyPoanM2+H/x1vRD+OH2e1nBAtGf2IpAhogXYA3BoBsmBB5mmeP4eVjI26rY5
 r1vg==
X-Gm-Message-State: AOAM533ahWgAraEvDqYAB/iMVSDXXLIcuz2ZZvgGXuxLVJSaZAATioOS
 DUBI0zPgwfW7ttBZkPCFDsKeCA==
X-Google-Smtp-Source: ABdhPJyNFMcPbWUco+Y+QNwEzgo/c6cxhTHy+B3buEgXZaS5imhK9G19CfKi/1d1jqh/zqA5P53RtQ==
X-Received: by 2002:a17:90a:6984:: with SMTP id
 s4mr1082688pjj.206.1604004524081; 
 Thu, 29 Oct 2020 13:48:44 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
 by smtp.gmail.com with ESMTPSA id e5sm808565pjd.0.2020.10.29.13.48.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2020 13:48:43 -0700 (PDT)
Date: Thu, 29 Oct 2020 13:48:42 -0700
From: mka@chromium.org
To: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <20201029204842.GC1855806@google.com>
References: <1603958841-20233-1-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603958841-20233-1-git-send-email-akhilpo@codeaurora.org>
Subject: Re: [Freedreno] [v4,1/3] drm/msm: Add support for GPU cooling
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dianders@chromium.org, linux-kernel@vger.kernel.org, dri-devel@freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Oct 29, 2020 at 01:37:19PM +0530, Akhil P Oommen wrote:
> Register GPU as a devfreq cooling device so that it can be passively
> cooled by the thermal framework.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

Wait, I did not post a 'Reviewed-by' tag for this patch!

I think the patch should be ok, but I'm still not super happy
about the resource management involving devfreq in general (see
discussion on https://patchwork.freedesktop.org/patch/394291/?series=82476&rev=1).
It's not really something introduced by this patch, but if it ever
gets fixed releasing the cooling device at the end of
msm_gpu_cleanup() after everything else might cause trouble.

In summary, I'm supportive of landing this patch, but reluctant to
'sign it off' because of the above.

In any case:

Tested-by: Matthias Kaehlcke <mka@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
