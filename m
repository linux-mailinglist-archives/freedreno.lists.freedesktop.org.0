Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F044EF1D09
	for <lists+freedreno@lfdr.de>; Wed,  6 Nov 2019 18:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C276E25E;
	Wed,  6 Nov 2019 17:59:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110456E25E;
 Wed,  6 Nov 2019 17:59:19 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id v3so2911744wmh.1;
 Wed, 06 Nov 2019 09:59:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ohhCdIQyNDGo4eqK+kLi0fkekXyA+TQ2KHQjimtJFL0=;
 b=HkugNQgGcKsCDe1q8qW318Nzjv2VicfWmjeHuE8yhMi3CcHvGfKFe4kRIeduB3IIlw
 4fZUi/rT6WGzr+zIs7+T0TjMeVhR3gDfeBNVJDj/nHDQjxXKDbXQYEyIvZAsJpjwO4Ai
 /hpL9omAByncqjUDUlaHFZgV9KVv9Aq+DPlz//kEhUQC/ZRX7VcrZX82pYLiu3NrhE+M
 VoTVcyXef9DZjUEvx/MmsxCumbNewfQZQVghTzOx/kMREFfrPKnfvOJKhhwMEmrykRuL
 y3/7A3b4O5dEBlInmpiJ4C627saV6X57IQAxgXXbB4mcJnvyhxIxFAjnODi7+fjkl1Jd
 jCCg==
X-Gm-Message-State: APjAAAVN2qDYtbfqxh3JDK/dNE9g/a5AVWXAdp5SVz/oXmEI2aMfJOW+
 nMQjkD5TL+Eps6LeFJzzsFY=
X-Google-Smtp-Source: APXvYqyz6kIMCTBVSrcHZYaOttuckNTvYf5lfHiASZp9OADbEVDbjDa5pyxJcAz4ASlpA4jnAsPYsw==
X-Received: by 2002:a05:600c:12:: with SMTP id
 g18mr3966165wmc.44.1573063157626; 
 Wed, 06 Nov 2019 09:59:17 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
 by smtp.gmail.com with ESMTPSA id u4sm14546463wrq.22.2019.11.06.09.59.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 Nov 2019 09:59:16 -0800 (PST)
From: kholk11@gmail.com
To: devicetree@vger.kernel.org
Date: Wed,  6 Nov 2019 18:59:05 +0100
Message-Id: <20191106175905.59745-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ohhCdIQyNDGo4eqK+kLi0fkekXyA+TQ2KHQjimtJFL0=;
 b=XwxnzklrwC7y3u9+CJmI5+Kwk+goAsS84fqa3fC4ttevbOLPLvyc1qHPKZkfYp3eqn
 PJYm2IjM899Qslu4NSr4KvWp7bztE5VUhWkxEXVzmVd633mUbMFL3MziKJHt4Voq/3GH
 UY7nyq6IMb5q2xrmmikKdx4LlD9hyFCkN4LR00NnRDZ6oqdJvaBBYFMZuFZJEqXp1hRx
 Cyi3LUFmqD7TxhsfUH9pe4WKQHp8JAuG7Uqs8rH//Goq6iCMSCBAHSWudtANXzP4B/vR
 tg3+zB3jVKbNlCNkTAZIcY3Z+R0HzF2AxDf4t6WK7193moPvxvsJWeOeoBwLugGZF9FR
 Zejw==
Subject: [Freedreno] [RESEND, v4,
 2/7] dt-bindings: msm/mdp5: Document optional TBU and TBU_RT clocks
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org, marijns95@gmail.com,
 jonathan@marek.ca, Rob Herring <robh@kernel.org>, airlied@linux.ie,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, robdclark@gmail.com, robh+dt@kernel.org,
 daniel@ffwll.ch, tglx@linutronix.de, kholk11@gmail.com, sean@poorly.run,
 georgi.djakov@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

RnJvbTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGtob2xrMTFAZ21haWwuY29tPgoKVGhl
c2UgdHdvIGNsb2NrcyBhcmVuJ3QgcHJlc2VudCBpbiBhbGwgdmVyc2lvbnMgb2YgdGhlIE1EUDUg
SFc6CndoZXJlIHByZXNlbnQsIHRoZXkgYXJlIG5lZWRlZCB0byBlbmFibGUgdGhlIFRyYW5zbGF0
aW9uIEJ1ZmZlcgpVbml0KHMpLgoKU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwg
UmVnbm8gPGtob2xrMTFAZ21haWwuY29tPgpBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9t
c20vbWRwNS50eHQgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL21k
cDUudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL21k
cDUudHh0CmluZGV4IDRlMTEzMzg1NDhhYS4uNDNkMTEyNzljOTI1IDEwMDY0NAotLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vbWRwNS50eHQKKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL21kcDUudHh0CkBA
IC03Niw2ICs3Niw4IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6CiBPcHRpb25hbCBwcm9wZXJ0aWVz
OgogLSBjbG9jay1uYW1lczogdGhlIGZvbGxvd2luZyBjbG9ja3MgYXJlIG9wdGlvbmFsOgogICAq
ICJsdXQiCisgICogInRidSIKKyAgKiAidGJ1X3J0IgogCiBFeGFtcGxlOgogCi0tIAoyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVu
byBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==
