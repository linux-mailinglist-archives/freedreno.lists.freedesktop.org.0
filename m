Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBBC2111B6
	for <lists+freedreno@lfdr.de>; Wed,  1 Jul 2020 19:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32F56E096;
	Wed,  1 Jul 2020 17:14:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69296E07F
 for <freedreno@lists.freedesktop.org>; Wed,  1 Jul 2020 17:14:42 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id o38so19023754qtf.6
 for <freedreno@lists.freedesktop.org>; Wed, 01 Jul 2020 10:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uyDrreb5/43nRuyXAG5DxhddbAStHj2IykaaREeLOAs=;
 b=lrfta52O1r0UsfmM79fscXfWiTmQ4Zl4t2olGT+gIZQ+ikYdcVVjEEd7tfkDk3mVJo
 2yeVQsPbar4qpD3ErrFTsEMkmKrRg76t0/D5OdajQasvPoDo2HEYmv2xcnO+9Cr06g/5
 Jhgc14xFsLMXwm3zxMkcSzoq/Te/N+53cBoyeqOmOdNzg12m6a2/JCR96jBDDynnF+0p
 XdFp+xxEdg2W/Hqx+zlpYGrcRGmEMvYDfAktg0VnTxy3DKaeHF29ak7MAJVmOg3kobx6
 o+dyGtunNjmaa4MAMH2gTlnr4U/10Ur7ZqaShJOB0OaBuTd35v18MCOnI/NBMC8jQ/bp
 xv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uyDrreb5/43nRuyXAG5DxhddbAStHj2IykaaREeLOAs=;
 b=Z1s2FIUYpU/cpM7iC0RDUOv9OPHOi4QDVBecngNWor7N+ZSA71Jat8xp9+Eb8sa/FG
 AXqPgr8jsYe40kX9KTHulhKl8kjcc2PqjFyz0Fiuq72CsC7NjMuS7wdertRSRJkYAX2g
 vbyGGgLAeyCuOLQnX6A2CblRF3HFP/cHVm/Kef9YXHyKke4W5hMGQsAoVPytzCx5n0L6
 SZEoJjU8BX2kTvQV9H6CPmbsM0KMdRwxCLUzqy73hNamMGVmhgROuz5U1JsjnrJwlkQy
 eWme+pLsmWLXb8v3k6BkleyFyOvK/PPaPKxxyluxwxrXLSL2REDYg4XCYvYkGi4UmDrF
 B3aQ==
X-Gm-Message-State: AOAM5308qH7BY9S9TaexHss+zuX7uCZbmeDuZEnJtybHXL46AVoYK5AH
 qRQXwOiSZFs/ldW68JymvMSyyw==
X-Google-Smtp-Source: ABdhPJwsdDTczZS+vX8/Nxdl4H4faN26QV/tRRi0cKAX20gxeG3JVW5sYGRaK3dP0UeDm5JOzT1QbQ==
X-Received: by 2002:ac8:728b:: with SMTP id v11mr28496958qto.297.1593623681674; 
 Wed, 01 Jul 2020 10:14:41 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id u27sm6069257qkm.121.2020.07.01.10.14.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 10:14:41 -0700 (PDT)
To: Matthias Kaehlcke <mka@chromium.org>
References: <20200701030842.24395-1-jonathan@marek.ca>
 <20200701171228.GC3191083@google.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <49af8f44-51d4-aded-a34e-55c7c5780008@marek.ca>
Date: Wed, 1 Jul 2020 13:13:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200701171228.GC3191083@google.com>
Content-Language: en-US
Subject: Re: [Freedreno] [PATCH] drm/msm: handle for EPROBE_DEFER for
 of_icc_get
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
Cc: Fabio Estevam <festevam@gmail.com>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, Jordan Crouse <jcrouse@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>,
 Brian Masney <masneyb@onstation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 7/1/20 1:12 PM, Matthias Kaehlcke wrote:
> Hi Jonathan,
> 
> On Tue, Jun 30, 2020 at 11:08:41PM -0400, Jonathan Marek wrote:
>> Check for EPROBE_DEFER instead of silently not using icc if the msm driver
>> probes before the interconnect driver.
> 
> Agreed with supporting deferred ICC probing.
> 
>> Only check for EPROBE_DEFER because of_icc_get can return other errors that
>> we want to ignore (ENODATA).
> 
> What would be the -ENODATA case?
> 

The of_icc_get for the ocmem_icc_path can return -ENODATA when the ocmem 
path is not specified (it is optional and only relevant for a3xx/a4xx).

> If the 'interconnects' property is not specified of_icc_get() returns NULL,
> shouldn't all (or most) errors be propagated rather than staying silent?
> 
> Thanks
> 
> Matthias
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
