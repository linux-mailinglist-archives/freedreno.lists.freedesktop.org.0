Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DA34EA24C
	for <lists+freedreno@lfdr.de>; Mon, 28 Mar 2022 23:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C58F10EDA3;
	Mon, 28 Mar 2022 21:18:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FDB10E11D
 for <freedreno@lists.freedesktop.org>; Mon, 28 Mar 2022 21:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648502317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=o/20j76lcDPeDTIfcY54M2M3yeP1hzS1Frzdk4vK99I=;
 b=TVW5fv6Yr44YYDqTnKZ2mkUZ3xIrxNRiEF1iBOwjU2KZ3SBf3jySBg82VBIwO3HJWXiDGG
 7eIJPah0YlfMm7xWA+Xf/7xnE2XC3+2cdFKCI39dypxN2hdyv+olzu+PfRVuIxEhAQB599
 uFUeUcBakxi3dDxPtWILWlcA7XyUDb8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-2WPpgwvBO-ysvfqcwou3Tg-1; Mon, 28 Mar 2022 17:18:29 -0400
X-MC-Unique: 2WPpgwvBO-ysvfqcwou3Tg-1
Received: by mail-qv1-f70.google.com with SMTP id
 j8-20020ad454c8000000b0044111c17099so12332995qvx.0
 for <freedreno@lists.freedesktop.org>; Mon, 28 Mar 2022 14:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=o/20j76lcDPeDTIfcY54M2M3yeP1hzS1Frzdk4vK99I=;
 b=Ts3RTDn4rXpzc8XfxMJmh/OI4tQxMrboxt4kAZmU4YleZ8FhBc+pTIwXiBS3Tzmyl/
 qUXA48jvu2eD9Xe34EY90G1OEKXfpfJgc0D+QnEDjCcO/NG8UQegNFlmQF53dNnN4JTn
 3EShVrWVcJispGIGTUYItUH4Uk7R0TRku7CB0koJ8QeZIZsAVEuXc7clpb06Fl0pYXEN
 eRle6tpUUhGCjv2/jrg765iWpxxrgrvzaCoanTl6WacX2kIobOzteQ0cLNhBNlIjsy2j
 vXPfCWwtVZgbzAUgxI5nR2aEux7nJLkLTQbNZCAGfalz6YLSP+FeMXb54Ml72GEO66PU
 zzoA==
X-Gm-Message-State: AOAM530MTPvN1SF3F2BWV86BLML37MkeGfhJWThlDpZ6rVbvFmD6KnSA
 nC6k3Gdsryrw9XAKEly1sRVsZ0APsvfVunw/Lgt+7UR6AeJzf1qYHLAN1qFk2WAttWzWEsYUnCZ
 wSqAxm3aUpa1zLlhmE0seHWJi82d1
X-Received: by 2002:a05:6214:29c8:b0:440:fac2:a6c with SMTP id
 gh8-20020a05621429c800b00440fac20a6cmr23153270qvb.96.1648502308562; 
 Mon, 28 Mar 2022 14:18:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx80FvxqgxoMsKHifZxJPlSaASMzEtm2PCjdcW91NHHki6CRsyrlYXzQuiJUFDSkSZnID/Qgg==
X-Received: by 2002:a05:6214:29c8:b0:440:fac2:a6c with SMTP id
 gh8-20020a05621429c800b00440fac20a6cmr23153243qvb.96.1648502308333; 
 Mon, 28 Mar 2022 14:18:28 -0700 (PDT)
Received: from [192.168.8.138] (pool-71-126-244-162.bstnma.fios.verizon.net.
 [71.126.244.162]) by smtp.gmail.com with ESMTPSA id
 br13-20020a05620a460d00b00680d020b4cbsm2856816qkb.10.2022.03.28.14.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 14:18:27 -0700 (PDT)
Message-ID: <dc0ead0da30d0ccf8c4c57a2548d293c57407080.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: events@lists.x.org, xorg-devel@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 libre-soc-dev@lists.libre-soc.org
Date: Mon, 28 Mar 2022 17:18:21 -0400
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.DarkModeFix.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: [Freedreno] 2022 X.org Foundation Election Candidates
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
Cc: board@foundation.x.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

To all X.Org Foundation Members:

The election for the X.Org Foundation Board of Directors will begin on 04 April
2022. We have 6 candidates who are running for 4 seats. They are:

    Emma Anholt
    Shashank Sharma
    Ricardo Garcia
    Mark Filion
    Lucas Stach
    Alyssa Rosenzweig

To be found in the link below below are the Personal Statements each candidate
submitted for your consideration along with their Statements of Contribution
that they submitted with the membership application. Please review each of the
candidates' statements to help you decide whom to vote for during the upcoming
election.

    https://www.x.org/wiki/BoardOfDirectors/Elections/2022/

If you have questions of the candidates, you should feel free to ask them here
on the mailing list.

The election committee will provide detailed instructions on how the voting
system will work when the voting period begins.

Lyude Paul, on behalf of the X.Org elections committee

