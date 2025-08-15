Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F45B278C6
	for <lists+freedreno@lfdr.de>; Fri, 15 Aug 2025 08:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C3710E22F;
	Fri, 15 Aug 2025 06:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="poB2z/mH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D5310E22F
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 06:05:32 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-45a1b05d252so10872585e9.1
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 23:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755237931; x=1755842731; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NLKGU002PnG8vgvK8+pdEgdjHah4yQTu8jqx2K5lOQw=;
 b=poB2z/mHzvRGs5AtCaukwTcO4poTNvVpoXsE48ABj1Y9vCT0KGm1m6RA/Pz+CDezfC
 cSwStHQsHoxBjWNLfXkXknR6ExiyML4qjvC5CjMZpN7ShH/HI2w1MwaEf5sa1KeWZTwW
 hRjYNyjZPCIAzQU6xJ4YyAxM2oALAfvmeiR0GLNj0IE9+tmkeLDN3HTQ/snXHCsivJyZ
 U6xe2Go/nl4u9rEh0A4Ao9caX7CvhR0gnixRLAN5Taf2TsVPKyA5BsKHkWnijbtdGzk/
 lZffIbnvyakA/+nJEqvn2ex5AnEa7O6Q+8TdYDv/kopE6eXJrzCy2lLQ7AB89TLDqKQh
 A5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755237931; x=1755842731;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NLKGU002PnG8vgvK8+pdEgdjHah4yQTu8jqx2K5lOQw=;
 b=fTvZVwSEPb8cEUWMP8BvdX2kQRJyDC8J4F3h16NgCvKQJgEWdSuRwo5q4wymnvwB7J
 lgk4BV7/64JUwHD6miaoGVSSyITHaQLjHz4w4q93+X8o3rVs9mCpXmyOeoP5AHHjap33
 5Mj34KX9oixMG1jQo7r0k/6EzeLXjOWcJfJ3dsfKxTdEAMmvKYaHqn3obFqlEvpwQY7k
 +qjsXoNU2+/awQaVlIGOY8fM1Kq2u+qeaq4WNC6gqzEshZgmuWWpewueO/qBlNHaqfJ1
 HlkbaiUReik3P4y3h0yPVcckOuGow17ZLoIhM/c6kEKz4AXgE2MjKLFhPSWYORbN0k4V
 /3+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0gL72Irp6x0txQPde+7WbNmLE25FxnuLat4sx92wwg/7wR455QEqxx7hORTl5eZMIIiORb1/j+GE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxRwuWvR2IJmctUO1tPhEd+KHgMxEsCDW9/wPX5P+Z9ly1UY1V
 V4m0+xZ8czUgsijQtMeV4fJDbtplMiGX+e0vys9247vxxRn0lvmuvlOB3/Mb0ueEQZk=
X-Gm-Gg: ASbGncsgU5ScOmtfbKJpL19YBlUBmWJVJn4oCHYx8r/cMtzO72awIa5mNpKCgIJzM/+
 aytuv3yy4ilkQtRglQanbRUVIWMYOMeNP+IYE/6WBrzL2kg2Sx51irBVRUU/vWADy0C3swJv43e
 yzMySU+DNJ/4EhSzg7bNkFPR0ZhWSzzc29zhT7gxz5rkL+/TeqTRdRHOWtuc3DydRUh4c2j5bs4
 pj44z5++XfOC0rT38jduhfIE/j8O7SWmyMddrb1ipYoWSKPx1cgR8e6czDWIAPIiz30Sk+PDytk
 WkwTSvgNWAQK/y8vJSeUgxs5AhN3Jv1UB2fJObUN4D9giWylKAVyM2OpEqu82vogb6I2h+4r36E
 1EEWricp1ro9oB0ZAJDeobBe6YfevDG2XNFJHmw==
X-Google-Smtp-Source: AGHT+IEkgNga8C/5/B/cMPHRG+dpfv/2kc5MmkWVx5Jah93fWQXG2dLd0tNnDvNF8b/UXTvivHbQyg==
X-Received: by 2002:a05:600c:a48:b0:43c:eeee:b713 with SMTP id
 5b1f17b1804b1-45a21844a8dmr6584795e9.20.1755237930554; 
 Thu, 14 Aug 2025 23:05:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45a1c6bc85csm45543355e9.5.2025.08.14.23.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 23:05:30 -0700 (PDT)
Date: Fri, 15 Aug 2025 09:05:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, freedreno@lists.freedesktop.org
Subject: Re: [bug report] drm/msm/adreno: Add support for ACD
Message-ID: <aJ7OJq4nwkAXp6SR@stanley.mountain>
References: <aJTL87hBAEtJb3VT@stanley.mountain>
 <2d54964b-1f60-4a58-8064-567611a3a126@oss.qualcomm.com>
 <aJwnNqfxZHfiVHZB@stanley.mountain>
 <cdd4757f-9433-4c80-b5b2-003d42038a87@oss.qualcomm.com>
 <aJ2K26ZBVZilC8jg@stanley.mountain>
 <CAF6AEGuO-8Y-dqsXZa5Oi4fTdzzWsOss5KEhyUkqiGCyuhVrdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGuO-8Y-dqsXZa5Oi4fTdzzWsOss5KEhyUkqiGCyuhVrdw@mail.gmail.com>
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

On Thu, Aug 14, 2025 at 06:57:35AM -0700, Rob Clark wrote:
> On Thu, Aug 14, 2025 at 12:06 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Thu, Aug 14, 2025 at 12:28:31AM +0530, Akhil P Oommen wrote:
> > > On 8/13/2025 11:18 AM, Dan Carpenter wrote:
> > > > On Fri, Aug 08, 2025 at 10:28:38PM +0530, Akhil P Oommen wrote:
> > > >> On 8/7/2025 9:23 PM, Dan Carpenter wrote:
> > > >>> Hello Akhil P Oommen,
> > > >>>
> > > >>> Commit b733fe7bff8b ("drm/msm/adreno: Add support for ACD") from Apr
> > > >>> 19, 2025 (linux-next), leads to the following Smatch static checker
> > > >>> warning:
> > > >>>
> > > >>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1700 a6xx_gmu_acd_probe()
> > > >>>   error: 'opp' dereferencing possible ERR_PTR()
> > > >>>
> > > >>> drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > >>>     1668 static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
> > > >>>     1669 {
> > > >>>     1670         struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
> > > >>>     1671         struct a6xx_hfi_acd_table *cmd = &gmu->acd_table;
> > > >>>     1672         struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> > > >>>     1673         struct msm_gpu *gpu = &adreno_gpu->base;
> > > >>>     1674         int ret, i, cmd_idx = 0;
> > > >>>     1675         extern bool disable_acd;
> > > >>>     1676
> > > >>>     1677         /* Skip ACD probe if requested via module param */
> > > >>>     1678         if (disable_acd) {
> > > >>>     1679                 DRM_DEV_ERROR(gmu->dev, "Skipping GPU ACD probe\n");
> > > >>>     1680                 return 0;
> > > >>>     1681         }
> > > >>>     1682
> > > >>>     1683         cmd->version = 1;
> > > >>>     1684         cmd->stride = 1;
> > > >>>     1685         cmd->enable_by_level = 0;
> > > >>>     1686
> > > >>>     1687         /* Skip freq = 0 and parse acd-level for rest of the OPPs */
> > > >>>     1688         for (i = 1; i < gmu->nr_gpu_freqs; i++) {
> > > >>>     1689                 struct dev_pm_opp *opp;
> > > >>>     1690                 struct device_node *np;
> > > >>>     1691                 unsigned long freq;
> > > >>>     1692                 u32 val;
> > > >>>     1693
> > > >>>     1694                 freq = gmu->gpu_freqs[i];
> > > >>>     1695                 opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, freq, true);
> > > >>>                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > >>> No error checking.
> > > >>
> > > >> We are passing back a freq which we pulled out from the opp_table a few
> > > >> lines before this. So it is unlikely that this call would fail.
> > > >>
> > > >> But it is okay to add a check here if that would make Smatch checker happy.
> > > >>
> > > >
> > > > No, no, just ignore it, if it can't fail.
> > > >
> > > > Or I can add dev_pm_opp_find_freq_exact() to the "no need to check" list.
> > > > That's easy to do.
> > >
> > > Would that make Smatch ignore usage of "dev_pm_opp_find_freq_exact()" in
> > > other code/drivers? If yes, we may not want that.
> >
> > It just wouldn't print this warning if people left off the error handling.
> >
> > I'm going to ignore it anyway, right?  I recently had a case where I got
> > mixed up which functions needed error handling and I ignored the wrong one.
> > We still caught it in testing, but I'm also going through and marking which ones
> > to ignore or not.
> 
> drive-by comment:  Would it be useful to have a comment that smatch
> could look for in cases like this.. similar to how rust has a practice
> of adding a comment describing unsafe blocks?  It could be a useful
> way to document "safe because: this isn't expected to fail" cases,
> both for humans and tools.
> 

I don't want to litter the code with comments silencing Smatch warnings.

Adding a comment for humans would be enough.  I hand review all these
warnings so I'd see the comment.  Otherwise, generally, I try to only
send warnings once.  We fix all the real bugs so all old warnings are
false positives.

regards,
dan carpenter
