Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 824EC4DB902
	for <lists+freedreno@lfdr.de>; Wed, 16 Mar 2022 20:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D8910EA34;
	Wed, 16 Mar 2022 19:47:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B5310EA31
 for <freedreno@lists.freedesktop.org>; Wed, 16 Mar 2022 19:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647460061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J0oI+0ISdRle63jGaS9/UHYnEMzVjtXKfWa9O2AXWGk=;
 b=TUygf+mIUcOtBUsJNUiTJsqSdNOTvQMqvsRl6kzFwKequ6fx6ul27htehbh/QbVtFpOdVC
 iORvGZlMGDnAmfMJptinvG5+znGo5XodTdVkNaiyN/8KidIeid6MEZg2eLtF07fc0SPGVr
 LS3W0k9MwC8ug7NxuFrgmSjf9sS/1c4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-NbJmkv8vPxiKWQqXq-gM0g-1; Wed, 16 Mar 2022 15:47:38 -0400
X-MC-Unique: NbJmkv8vPxiKWQqXq-gM0g-1
Received: by mail-qv1-f71.google.com with SMTP id
 dj3-20020a056214090300b004354a9c60aaso2492150qvb.0
 for <freedreno@lists.freedesktop.org>; Wed, 16 Mar 2022 12:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=J0oI+0ISdRle63jGaS9/UHYnEMzVjtXKfWa9O2AXWGk=;
 b=ZhyMskvFtBwpo93UNHaP1phmqugGYjUcYDO3FYo4otQbQRa4DstqELUTjqZ2jLqlS0
 Q1CF/LjehPJAVA59pnUgH4Yq8qY06DObkO/tD9lNlH1KzFUMOi1S+N1vMLunbs2OtZtl
 1n3/DDd7fsfAHWEYNno1KcWfJ9TVFTQiTM89eSOIu7++X8Txk791zelJl/s9jEiBU4M2
 5NyxZ2BkKGy58LJ69Aib6mhcmOJCfW5rEl44oZYqSb62Dl3Gq9AC1pBr+sPO6ySFsFWP
 qv3g+UZnlt3V//LC/8upuvb4Biphb5Mp2YFyG/SiO3Y7UPM4JZwIk3Dlu+f2vuFE0r+O
 zi8g==
X-Gm-Message-State: AOAM531QhCxKrxWlWWlpeKzFf/8wxj9r9JSovgDTUCNnPlbNV/deemB6
 9P0LPkiGCA2+0Wd/lwh1TEsW/BjLLdUWYqI7afxmampag91/2Hl9jtJHYg1hFXHHTxCCDnMxLsC
 5sGSMbXJrLhIMMxgUCk+LvH9HDY9a
X-Received: by 2002:a05:6214:dcb:b0:435:cb9c:b0b4 with SMTP id
 11-20020a0562140dcb00b00435cb9cb0b4mr1081805qvt.119.1647460057834; 
 Wed, 16 Mar 2022 12:47:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwd6yBQg5t9nqQt2lYJt49ehTyptVw7upMg0uojKxcC/Ku5glPD14dTM2VhzVpmsxZJOfIDgQ==
X-Received: by 2002:a05:6214:dcb:b0:435:cb9c:b0b4 with SMTP id
 11-20020a0562140dcb00b00435cb9cb0b4mr1081787qvt.119.1647460057597; 
 Wed, 16 Mar 2022 12:47:37 -0700 (PDT)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15]) by smtp.gmail.com with ESMTPSA id
 c27-20020a05620a165b00b0067d32238bc8sm1237699qko.125.2022.03.16.12.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 12:47:36 -0700 (PDT)
Message-ID: <0e029c57f314bb6139e72ff22a3f7667c99b7f26.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: events@lists.x.org, xorg-devel@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 libre-soc-dev@lists.libre-soc.org
Date: Wed, 16 Mar 2022 15:47:35 -0400
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] 2022 X.Org Board of Directors Elections Nomination
 period is NOW
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

The Board consists of directors elected from the membership.  Each year, an
election is held to bring the total number of directors to eight. The four
members receiving the highest vote totals will serve as directors for two year
terms.

The directors who received two year terms starting in 2021 were Lyude Paul,
Samuel Iglesias Gonsálvez, Manasi D Navare and Daniel Vetter. They will
continue to serve until their term ends in 2023. Current directors whose term
expires in 2022 are Emma Anholt, Keith Packard, Harry Wentland and Mark
Filion.

A director is expected to participate in the fortnightly IRC meeting to
discuss current business and to attend the annual meeting of the X.Org
Foundation, which will be held at a location determined in advance by the
Board of Directors.

A member may nominate themselves or any other member they feel is qualified.
Nominations should be sent to the Election Committee at elections at x.org.

Nominees shall be required to be current members of the X.Org Foundation, and
submit a personal statement of up to 200 words that will be provided to
prospective voters.  The collected statements, along with the statement of
contribution to the X.Org Foundation in the member's account page on
http://members.x.org, will be made available to all voters to help them make
their voting decisions.

Nominations, membership applications or renewals and completed personal
statements must be received no later than 23:59 UTC on 20th March 2022.

The slate of candidates will be published 28th March 2022 and candidate Q&A
will begin then. The deadline for Xorg membership applications and renewals is
31st March 2022.

Cheers,
   Lyude Paul, on behalf of the X.Org BoD

