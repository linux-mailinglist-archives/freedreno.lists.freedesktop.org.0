Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DC8B17FB9
	for <lists+freedreno@lfdr.de>; Fri,  1 Aug 2025 11:57:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11F710E82D;
	Fri,  1 Aug 2025 09:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cfVzuiud";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220CE10E82D
 for <freedreno@lists.freedesktop.org>; Fri,  1 Aug 2025 09:57:45 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3b785a69454so372278f8f.2
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 02:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754042263; x=1754647063; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VbBODNH9DSThm5SeIXhQXJFSfFVhTqqwIgLxqRhp64U=;
 b=cfVzuiudGF1UsNfO3nF1U8tq1rDKAyeChVvuaNmndEJcJdusdrN46XPApPv5ZPoITe
 BZcpI8QyiXy9hzDCG8b1dCBO/OHQ6TAcX7PSKD70ZA9735RQ2fbm99FvThQ3Kuwh9aq7
 u8E5jZbrqDLGgiJk0hqub6cLmoYxh2cQdopWg14LZJXjZtxJYSQOHs6PvMHL6ihNadiV
 y9M/Mv1poq0rBbTOuLdZx6tjBv7tEAG7uYkZ9QvJOa8vxFeUboqxemJmKRRndH3P1PCZ
 T/E8I8D3dbZ+Eixl7Dsx76Vl0urtGZyXIbyiKlpEY6kxMOuOWX46/+hlP6AdC6jgcg6X
 ssbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754042263; x=1754647063;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VbBODNH9DSThm5SeIXhQXJFSfFVhTqqwIgLxqRhp64U=;
 b=afOo84zmu04daVJtcJ6vSmHuD7eR+URK9llTirnpfBovBRj1o5NIgjzRTFwj1EnGXh
 PCAMNtwfs9VAAnRhPEwW6I80n/tgYO+iDAarRxFmiGVlKl9DTec+oNlOwzEstgPavLXY
 3GFvMAafrrgY4KegHbGEDd+IgFhqbXEiv1l5ROy6UqNwZMpU3Xhz0s7eE6R/3EG7HiDp
 pywQEBqEShmuAlozvwyalCjXqxJsJVqmwtPab0/OJJdBs6wTze0DUMtu12PM87h9hXyU
 hR7Ba9qwtzavmp+yj7dvoOlGRUZ/wtZvoHQ8W+s7LjY9gJzjl6liG0dyvTTmj5T3oyJu
 HJqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkjpGnZqTNuXBJahZ5w3YOmsZM2WlihDuYdxUiVa0f3P/vynqqBQW5OFvaAUUnUUrjVFqgdHsNr4A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxH2BHaUMp0qlRwpa0NEjFmpXO11zHw7mbGlKqvCGRs1E566emb
 yHMSyY1mo9ld8A5HN9H9IUrB9TQ45jr6K3RADEu7ePWJpiUo2g6hNOWyyUDs6FGKcsw=
X-Gm-Gg: ASbGnctTIjNJFE889RwrNBlr6CGMJYVYLezJ8gBkV2R+VkN4VkK68wICyp4Wn1MeK38
 2ppY7Q41iFgo/Vf4KU3lueFQywjf+5a0Zp647QdsLW5lGMoGlEjNMNY0CrvKIVx6PvY9PAKozSJ
 RoromeLe73Q91B9aVwJA4YDsq3ft+PuGf70Lo7QdfL/ajVzKsv0ZABPyBXr3D7av6aPte2sMDYp
 IlIQMEnDDpr2dg5S8k2HPLWi6Dwtl2/SWedl+qVMnJDOXcmYpbupQd8ZVv3jDW/r+okfMOvx1Zn
 8NPt3kE057dVMY0mCcqnex1EQ3+w/XDQzXQF1wBtyNjsR+Mh31vmcD05oN1fskYdGX06S3cXbXJ
 utVva64TVn5kSycj4yp3tCdb7ZO4eUKaKTsgytw==
X-Google-Smtp-Source: AGHT+IHzyoDcCiL+JPwQRfpK5ouMx59bmsQZVcTlRlpf7ucs7d1aEnm3ysW/zjth+CEaShGfegwMlQ==
X-Received: by 2002:a5d:64c7:0:b0:3a4:f975:30f7 with SMTP id
 ffacd0b85a97d-3b79501ecb9mr8611991f8f.56.1754042263555; 
 Fri, 01 Aug 2025 02:57:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-458953cfe56sm102692665e9.20.2025.08.01.02.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 02:57:43 -0700 (PDT)
Date: Fri, 1 Aug 2025 12:57:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [bug report] drm/msm: Take lru lock once per submit_pin_objects()
Message-ID: <aIyPkrQl0YPu5ke2@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Rob Clark,

Commit fc896cf3d691 ("drm/msm: Take lru lock once per
submit_pin_objects()") from Aug 2, 2023 (linux-next), leads to the
following Smatch static checker warning:

	drivers/gpu/drm/msm/msm_gem.c:565 get_and_pin_iova_range_locked()
	warn: sleeping in atomic context

drivers/gpu/drm/msm/msm_gem.c
    546 static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
    547                                          struct drm_gpuvm *vm, uint64_t *iova,
    548                                          u64 range_start, u64 range_end)
    549 {
    550         struct drm_gpuva *vma;
    551         int ret;
    552 
    553         msm_gem_assert_locked(obj);
    554 
    555         if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
    556                 return -EINVAL;
    557 
    558         vma = get_vma_locked(obj, vm, range_start, range_end);
    559         if (IS_ERR(vma))
    560                 return PTR_ERR(vma);
    561 
    562         ret = msm_gem_pin_vma_locked(obj, vma);
    563         if (!ret) {
    564                 *iova = vma->va.addr;
--> 565                 pin_obj_locked(obj);
                        ^^^^^^^^^^^^^^^^^^^^
This takes a mutex but Smatch thinks we're already holding a spinlock.

    566         }
    567 
    568         return ret;
    569 }

The call tree is:

update_cursor() <- disables preempt
-> msm_gem_get_and_pin_iova()
   -> msm_gem_get_and_pin_iova_range()
      -> get_and_pin_iova_range_locked()

The update_cursor() function is holding
	spin_lock_irqsave(&mdp4_crtc->cursor.lock, flags);

regards,
dan carpenter
