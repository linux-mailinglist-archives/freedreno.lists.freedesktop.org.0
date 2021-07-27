Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0AC3D7E70
	for <lists+freedreno@lfdr.de>; Tue, 27 Jul 2021 21:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D836E527;
	Tue, 27 Jul 2021 19:21:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCAE6E527
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jul 2021 19:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627413688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uGKrqOctliwjS0X4Sldrr5gAehx34qSkobccEFs4N28=;
 b=Th2dcNera7r/ZbDALWiGquRDPT0KXEOH+JilueOzjbTd7kOcfZgmCyLwqI/zp80GCPuiGV
 TxTtyBZFsapepo//NwY1HajOi9D8m7C/a7QAWrcbfOjbzLesvDu9sV0nuqheUkGfBmPbnK
 tWnPmr45civoMEHui2nyj8WwyJ1hsCQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-VYyLTI-tOcK3pfuaHHW4Ew-1; Tue, 27 Jul 2021 15:21:26 -0400
X-MC-Unique: VYyLTI-tOcK3pfuaHHW4Ew-1
Received: by mail-qv1-f69.google.com with SMTP id
 r14-20020a0c8d0e0000b02902e82df307f0so270422qvb.4
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jul 2021 12:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=uGKrqOctliwjS0X4Sldrr5gAehx34qSkobccEFs4N28=;
 b=jkzB2KXi/t/yMTpX8flVtiLb3Sq7tYuGIbQThGulebPEGKhiRFp+jEFefbDTgkqUw9
 5HEaVizaGdYOgU9bEDtqzXBb/P4XjkG4bPWw1ZJ8Aanw7yxmu9JiTpT4sQzSFTMNXj+/
 OpOcJQeHVT1SZyAPoIXE15rUSco9DpBmm30kj5p6mWSKZ3zmj8sBbt8pDEU4EEfS7PW8
 yrp0BuiwmK1KSGYgJWBrj8FweYdFdOlaTKKK4CqQ9jfW6o0VRvPBWI7msH1M+BGBAwNr
 4wod+2xG+JRw6304IBM6TZgKnyPLxtThuYX4372TgvRUUOA9B116Z+eALZYEnRO0sAXj
 u+fQ==
X-Gm-Message-State: AOAM5331xU1i+O5IDH1wIAJRXT0LV874v0MMzIBCSZFxDW5zyZ881lcA
 OnVWysr3AA1nV0Efi33YE6mrsaP8JAjbZD97aKFkdwZOB8PgfvebOFZj/EIkSE8wRoXOHMhRF6M
 DFo0mGRRdQCTvRQAZjUvb9JV0h/lS
X-Received: by 2002:a05:620a:13a1:: with SMTP id
 m1mr22845971qki.91.1627413686306; 
 Tue, 27 Jul 2021 12:21:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmGZgQ7NnlCRlYkJ8czqKlAtNQKQ4f+q3WwLktTQbZsVbgcLLxWZj0DA7sLlD/FFLHp/3Lpw==
X-Received: by 2002:a05:620a:13a1:: with SMTP id
 m1mr22845940qki.91.1627413686080; 
 Tue, 27 Jul 2021 12:21:26 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id r16sm2124371qke.73.2021.07.27.12.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 12:21:25 -0700 (PDT)
Message-ID: <79c5a60fc189261b7a9ef611acd126a41f921593.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: khsieh@codeaurora.org
Date: Tue, 27 Jul 2021 15:21:23 -0400
In-Reply-To: <d9ec812b4be57e32246735ca2f5e9560@codeaurora.org>
References: <1625585434-9562-1-git-send-email-khsieh@codeaurora.org>
 <87zguy7c5a.fsf@intel.com>
 <a514c19f712a6feeddf854dc17cb8eb5@codeaurora.org>
 <2da3949fa3504592da42c9d01dc060691c6a8b8b.camel@redhat.com>
 <d9ec812b4be57e32246735ca2f5e9560@codeaurora.org>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Freedreno] [PATCH v3] drm/dp_mst: Fix return code on sideband
 message failure
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
Cc: mripard@kernel.org, rnayak@codeaurora.org, tzimmermann@suse.de,
 airlied@linux.ie, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, swboyd@chromium.org,
 robdclark@gmail.com, Jani Nikula <jani.nikula@linux.intel.com>,
 daniel@ffwll.ch, aravindh@codeaurora.org, sean@poorly.run,
 rsubbia@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 2021-07-22 at 15:28 -0700, khsieh@codeaurora.org wrote:
> 
> It looks like this patch is good to go (mainlined).
> Anything needed from me to do?
> Thanks,

Do you have access for pushing this patch? If not let me know and I can go
ahead and push it to drm-misc-next for you.

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
