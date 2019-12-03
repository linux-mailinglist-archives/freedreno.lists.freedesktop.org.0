Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDF011012E
	for <lists+freedreno@lfdr.de>; Tue,  3 Dec 2019 16:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780B86E9C9;
	Tue,  3 Dec 2019 15:24:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 532 seconds by postgrey-1.36 at gabe;
 Tue, 03 Dec 2019 15:24:55 UTC
Received: from a27-21.smtp-out.us-west-2.amazonses.com
 (a27-21.smtp-out.us-west-2.amazonses.com [54.240.27.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C196E9C9
 for <freedreno@lists.freedesktop.org>; Tue,  3 Dec 2019 15:24:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 25712C4479F
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Tue, 3 Dec 2019 15:16:02 +0000
Message-ID: <0101016ecc5524fa-c345dee4-91e7-4b69-bd68-dc84262a4882-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
X-SES-Outgoing: 2019.12.03-54.240.27.21
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575386162;
 h=From:To:Cc:Subject:Date:Message-Id;
 bh=hpHeJVb7EJbjQPotxf9qoETKMkrBAc2t8j9KkouUgoc=;
 b=JcRBbXDJn02cMc4oPobHRgWu2YqUZHeRPA6vtu0zVUZxQ9Mvzfyvds1ZlB47ePHy
 Gh2iPB3jj0FQxLSyZ/cyJ5vStZ32V8a+ljwquLS/zryJSniEUOpucjztSbnLFe7bsYO
 CEsUjlItQTTffRk3oJAjTEgmLWguKy5FX6Z+u86Y=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575386162;
 h=From:To:Cc:Subject:Date:Message-Id:Feedback-ID;
 bh=hpHeJVb7EJbjQPotxf9qoETKMkrBAc2t8j9KkouUgoc=;
 b=R3KXkAY/Pkzejc8VoRdthudVhMNfyvAAUMV3M5I6JE+i1V9kke85dzOSLTdi74ZW
 97w29SSNOPP0+VJ7gcgDFiPqDlPKx48ZRp4AvjJ5VDtc57lkOuuTAkNLIpCnp2gc2OI
 UEzRyOx3GhXytRDP8fjuFdNNSOGI0+KoK80+knjs=
X-Mailman-Original-Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
Subject: [Freedreno] [PATCH 0/5] Add support for A618 GPU
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
Cc: linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 dri-devel@freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIEE2MTggR1BVLiBQbGVhc2UgcmV2aWV3LgoKU2hh
cmF0IE1hc2V0dHkgKDUpOgogIGRybTogbXNtOiBBZGQgNjE4IGdwdSB0byB0aGUgYWRyZW5vIGdw
dSBsaXN0CiAgZHJtOiBtc206IGE2eHg6IEFkZCBzdXBwb3J0IGZvciBBNjE4CiAgZHJtOiBtc206
IGE2eHg6IER1bXAgR0JJRiByZWdpc3RlcnMsIGRlYnVnYnVzIGluIGdwdSBzdGF0ZQogIGRybTog
bXNtOiBhNnh4OiBmaXggZGVidWcgYnVzIHJlZ2lzdGVyIGNvbmZpZ3VyYXRpb24KICBhcm06IGR0
czogc2M3MTgwOiBBZGQgQTYxOCBncHUgZHQgYmxvYgoKIGFyY2gvYXJtNjQvYm9vdC9kdHMvcWNv
bS9zYzcxODAuZHRzaSAgICAgICAgfCAxMTYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKwog
ZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eC54bWwuaCAgICAgICB8ICA1MiArKysrKysr
KysrKystCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jICAgICAgIHwgIDI0
ICsrKysrLQogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHUuYyAgICAgICB8ICA3
MCArKysrKysrKysrKysrKystLQogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHUu
aCAgICAgICB8ICAgOSArKy0KIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1X3N0
YXRlLmMgfCAgNzYgKysrKysrKysrKysrLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVu
by9hNnh4X2dwdV9zdGF0ZS5oIHwgIDE2ICsrKy0KIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5v
L2FkcmVub19kZXZpY2UuYyAgfCAgMTEgKysrCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9h
ZHJlbm9fZ3B1LmggICAgIHwgIDEyICsrLQogOSBmaWxlcyBjaGFuZ2VkLCAzNDggaW5zZXJ0aW9u
cygrKSwgMzggZGVsZXRpb25zKC0pCgotLQoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9A
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZnJlZWRyZW5v
