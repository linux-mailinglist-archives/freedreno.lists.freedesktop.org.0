Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229FC598FAC
	for <lists+freedreno@lfdr.de>; Thu, 18 Aug 2022 23:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07D310EF3B;
	Thu, 18 Aug 2022 21:38:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7377510F0C4
 for <freedreno@lists.freedesktop.org>; Thu, 18 Aug 2022 21:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660858682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lScf9Dov1eqBcZW4o7xmR0mpAM2ZlF/Ug/GDTkmjTuQ=;
 b=VFZa+lIpWZHDuq1f4tytOW3QR6fv+gJ5cX0Jsnc5Xdb9tBvf7f8gBqWuG/jNljuM3yN44M
 x4eMlly1eT7/UVmZ/xkFoaI8xqu/u7U5sUQnLR9HQjDdr50eKXREZ9trPAAEaiumdN41GQ
 OS/Qj4SSxau77CNqA0SKxoGbOiH7OSI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-110-ZESnKR7bNsyYUYAgRM8GVQ-1; Thu, 18 Aug 2022 17:38:01 -0400
X-MC-Unique: ZESnKR7bNsyYUYAgRM8GVQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 hf13-20020a05622a608d00b003214b6b3777so2098770qtb.13
 for <freedreno@lists.freedesktop.org>; Thu, 18 Aug 2022 14:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization:date
 :to:from:subject:message-id:x-gm-message-state:from:to:cc;
 bh=lScf9Dov1eqBcZW4o7xmR0mpAM2ZlF/Ug/GDTkmjTuQ=;
 b=j9fXKzBMtdy8UTM2Q/1j3Lz0SLfZT55lom4UVVvNhqj6ENhAiNu6KfZDWIKQyZrKiC
 ydEuLzImm3UFmVTd8ugMbhV0Nw7KPPVIyq2ZR03/15ko60MXspN42diqbm2VDBbkG6E1
 Hus73p3S2KjXGx+JUx8yduLlpIi+jeMTc0b0b66ymFbJ8WnAqg+nLHPk4D9Pmmj6MblT
 tYvrLsM7TCktGfUUTx3ZubFtz/FNhLiJVBcc1NYToNsCpNiMPjdozBtk+dWIw9p8jFc+
 2pbaxDgrv3h4Ekho5cfqJqPyp+17uVXMSe5POqXm9Cb3pbU6tNIzFveR+Y3maJqRdU8S
 U1aQ==
X-Gm-Message-State: ACgBeo2wEfsaKgcr0K9nBDTS3OyAlI6a6shwJ1LsB2ZNBjROOcRXWR1H
 FiKdFb07OBdv/kis8NIjpPxLJgA+O4nkcqhoGkB5JJA4JnZu9q0rxW5k9KLE9XkpJR7J8lJTbzK
 BHpqOX33KE/qlNg5R0NRDGDkxBtKbC9n+WlcL9iDPl75P/UjaCrj2vYWZz3jeCMdqlSVdJjR0tz
 hD
X-Received: by 2002:a05:620a:450e:b0:6bb:a4cf:de01 with SMTP id
 t14-20020a05620a450e00b006bba4cfde01mr3660398qkp.636.1660858680608; 
 Thu, 18 Aug 2022 14:38:00 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4eJbJ6MHspJZofKg/uG3Q4hmV5Ec879fTMGZtNRbiHqYpbk/vZLhJu7X5k38OzaQEGP0vR+A==
X-Received: by 2002:a05:620a:450e:b0:6bb:a4cf:de01 with SMTP id
 t14-20020a05620a450e00b006bba4cfde01mr3660386qkp.636.1660858680333; 
 Thu, 18 Aug 2022 14:38:00 -0700 (PDT)
Received: from [192.168.8.138] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 f9-20020ac84989000000b0034490214788sm1714155qtq.49.2022.08.18.14.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 14:37:59 -0700 (PDT)
Message-ID: <b759d459b1a5a5446e838e80159711ec9ceb2174.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: freedreno@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, nouveau@lists.freedesktop.org
Date: Thu, 18 Aug 2022 17:37:59 -0400
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: [Freedreno] Requests For Proposals for hosting XDC 2023 are now open
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

Hello everyone!

The X.org board is soliciting proposals to host XDC in 2023. Since
XDC 2022 is being held in North America this year, XDC 2023 is expected
to be in Europe. However, the board is open to other locations,
especially if there's an interesting co-location with another
conference.

If you're considering hosting XDC, we've assembled a wiki page with
what's generally expected and needed:

https://www.x.org/wiki/Events/RFP/

When submitting your proposal, please make sure to include at least the
key information about the potential location in question, possible
dates along with estimated costs. Proposals can be submitted to board
at foundation.x.org until the deadline of *September 1st, 2022*. 

Additionally, an quirk early heads-up to the board if you're
considering hosting would be appreciated, in case we need to adjust the
schedule a bit. Also, earlier is better since there generally will be a
bit of Q&A with organizers.

And if you just have some questions about what organizing XDC entails,
please feel free to chat with previous organizers, or someone from the
board.

Best regards,
	Lyude Paul
On behalf of X.org

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

