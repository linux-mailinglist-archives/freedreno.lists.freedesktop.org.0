Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B354DB90D
	for <lists+freedreno@lfdr.de>; Wed, 16 Mar 2022 20:50:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0517910EA4E;
	Wed, 16 Mar 2022 19:50:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE3810EA48
 for <freedreno@lists.freedesktop.org>; Wed, 16 Mar 2022 19:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647460235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IULt7o04qvCwavoveFrjEv+6PMDAGbABDhR83fNGGMs=;
 b=Vo/qvg3pp49Vh1pB4CV+Gvw+wReN7mTXZtcJXj7vlri5Nt6Gqb/2qK/I2B1qqFDyR/T5jL
 FDIFfF8Kn0JJsvEQaG2D5+I6uH5Wyhw2EJY3dKaA8IifzWqLnwOjym2Qb+KnDrVNKHrSNs
 iH5fgGRRpQ+++K/Ay/5RIoUb1W1Onmc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-lyW33g0FOm2lgH7zfvIiEA-1; Wed, 16 Mar 2022 15:50:32 -0400
X-MC-Unique: lyW33g0FOm2lgH7zfvIiEA-1
Received: by mail-qv1-f70.google.com with SMTP id
 p12-20020a0c9a0c000000b0043299cbbd36so2421920qvd.16
 for <freedreno@lists.freedesktop.org>; Wed, 16 Mar 2022 12:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=IULt7o04qvCwavoveFrjEv+6PMDAGbABDhR83fNGGMs=;
 b=7/bkZTtJguk0tDtBdLLJqz0yMDLzWJ+3Q3OW3lAZKc1B3GF5XYItGdaNJphh7qpZ7J
 f64JyFWtOuQ6BrYs2TF5JGFCRxX6s2ME6CZa0W7eVhTXqAw5ANAagpxauGR5CQPgspc7
 IQPWaGj5hLky3TWRG6Wr02hEAWyV9kVimYF+xmJQeOF2hLFkWEQJqnIbfDi4KSmONCem
 fdYg0aP9E5ZvqCVQLl8F2ChGdkU6qvwnN8gQ7sEukMueSpJwtexA1YKwPiWA/ZrGUqRi
 9zV5l521knk1Uy4oq4NKI5l5NjbHAev33aUxS5vO0dePaCqHRfrdDRo/5/WdWPSBlJoB
 +EnQ==
X-Gm-Message-State: AOAM532LVPp1gTB1Q5lp1Bwq2Uk/nlA8rJK1NvdxCPkn0PeTUenHeZ2x
 /nh3OAus4Vn1qHDN9pjMQ96rOaHOTWmXenG3hSE4nsAOMWvn/WGmZV4WRFYCEJ71mpAkGpMGTaK
 bYYHhZV7yv9Y/3o2AGGccSDm1O4al
X-Received: by 2002:a05:622a:15d1:b0:2e1:e43a:5d8f with SMTP id
 d17-20020a05622a15d100b002e1e43a5d8fmr1272097qty.140.1647460231595; 
 Wed, 16 Mar 2022 12:50:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxh4lpEBRc4yxekchAYCkuCPJHbF3ageo0B4XggIr5OARMmH3VDkNNZctHxN64Hf6q3V4ltsw==
X-Received: by 2002:a05:622a:15d1:b0:2e1:e43a:5d8f with SMTP id
 d17-20020a05622a15d100b002e1e43a5d8fmr1272083qty.140.1647460231386; 
 Wed, 16 Mar 2022 12:50:31 -0700 (PDT)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15]) by smtp.gmail.com with ESMTPSA id
 v129-20020a379387000000b0064936bab2fcsm1320346qkd.48.2022.03.16.12.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 12:50:30 -0700 (PDT)
Message-ID: <2cbea441243bce09ec11bfe19b5bc2a727b94690.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: xorg@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 events@lists.x.org, xorg-devel@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 libre-soc-dev@lists.libre-soc.org
Date: Wed, 16 Mar 2022 15:50:29 -0400
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: [Freedreno] 2022 X.Org Foundation Membership deadline for voting in
 the election
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

The 2022 X.Org Foundation elections are rapidly approaching. We will be
forwarding the election schedule and nominating process to the
membership shortly.

Please note that only current members can vote in the upcoming election,
and that the deadline for new memberships or renewals to vote in the
upcoming election is 31 March 2022 at 23:59 UTC.

If you are interested in joining the X.Org Foundation or in renewing
your membership, please visit the membership system site at:
https://members.x.org/

Lyude Paul, on behalf of the X.Org elections committee

