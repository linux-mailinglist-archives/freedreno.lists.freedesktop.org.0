Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAF744D75
	for <lists+freedreno@lfdr.de>; Thu, 13 Jun 2019 22:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358D1891CC;
	Thu, 13 Jun 2019 20:31:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869DB891DB
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jun 2019 20:13:16 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id m29so24120580qtu.1
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jun 2019 13:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=wvS6rY6fiOclRJfIV/D2hBg/6UXfJIIPm4B4bACKZz8=;
 b=asfFjiJnOFhBlRndzoB7wZ43TSnI+MsYl4NVGGlSawAWdqeaFUPMwyjQyNdlBVIDob
 Zvd+J24TPioTrBCrPfYd+Qnoj/zCDhGQnSs1+JJxy9cDNR9rZNeKSvDEUmZUDml6MCtM
 gbJ5kPuvyZjNGRmrVxfVlKOEITfoKi1Adrw64exLRIdpdqmKPzwC5pcn5fWGx/gqIeza
 Z7Nmb4lg8QAQLp54i1VIssbtO2hySJzbTXAugB3MDLP4AmWiUsA29zxbHc1Se1EtObof
 HOH2wTuhvEDe2khOfXhDQ+S1co7T4yMyWPszSe7/NVCnfuEAbV3JBZOx6A/Eo893654U
 Vp6A==
X-Gm-Message-State: APjAAAUM2AdqU+/hnKWYqXuqFb/tYcJkKYXzbYDUYhQ0kIsr5fx6Mbuc
 /SDhtg6+revQ29aLoZMrh1twdNPg0dHbnee15Fe/aLzuxcgDfg==
X-Google-Smtp-Source: APXvYqxWyFG99Ct6+QLgIzYtC2nFrJPWli73Mpub+sqBtV6mrY7PVaaQNI1DAnxScJGvgATRbOeFqOwsixGDdCryNzE=
X-Received: by 2002:a0c:add8:: with SMTP id x24mr5123019qvc.167.1560456795436; 
 Thu, 13 Jun 2019 13:13:15 -0700 (PDT)
MIME-Version: 1.0
From: Nathan Huckleberry <nhuck@google.com>
Date: Thu, 13 Jun 2019 13:13:04 -0700
Message-ID: <CAJkfWY50geqLZv=dnchNEGp4i1yy0QfmTSz30uL6DXJXAq3VuA@mail.gmail.com>
To: jsanka@codeaurora.org, robdclark@gmail.com, sean@poorly.run, 
 airlied@linux.ie, daniel@ffwll.ch
X-Mailman-Approved-At: Thu, 13 Jun 2019 20:31:28 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=wvS6rY6fiOclRJfIV/D2hBg/6UXfJIIPm4B4bACKZz8=;
 b=HYg9YO4tNI0fAvnYBqGA4GHJTrCc+LilCgHH9hKNNNHCrPFgKufk5stqe+dbMkNVqr
 HqerBE0ZU1S9XNvUlRzSNM2WVfb2xR/bOlOfyodDJ4rOQ6cuoFu9mjF0jIs9YfSSrNsZ
 yiYSGIAs1Q2l35lfEnbUESGmL4kEUxqLPcRnrXfi/sUCae4UDijczQOtXXl0ooIXVmir
 tqIrBRxS9WHRSWV1q+R2sX9hRJ1aua7zkTpBanPHAR3BJpvZ2+aI+uUalMJGZWoCGDiN
 +3FBbwVNVFJ4zzxiidZrklYOyVcH1E+ivsDndTFaNYnLVHR535KTDmdvYbZ1Rvcjvo5e
 i9yw==
Subject: [Freedreno] Cleanup of -Wunused-const-variable in
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

SGV5IGFsbCwKCkknbSBsb29raW5nIGludG8gY2xlYW5pbmcgdXAgaWdub3JlZCB3YXJuaW5ncyBp
biB0aGUga2VybmVsIHNvIHdlIGNhbgpyZW1vdmUgY29tcGlsZXIgZmxhZ3MgdG8gaWdub3JlIHdh
cm5pbmdzLgoKVGhlcmUgYXJlIHNldmVyYWwgdW51c2VkIHZhcmlhYmxlcyBpbiBkcHVfZm9ybWF0
cy5jCignZHB1X2Zvcm1hdF9tYXBfdGlsZScsICdkcHVfZm9ybWF0X21hcF9wMDEwJywKJ2RwdV9m
b3JtYXRfbWFwX3AwMTBfdWJ3YycsICdkcHVfZm9ybWF0X21hcF90cDEwX3Vid2MnKS4KVGhleSBs
b29rIGxpa2UgbW9kaWZpZXJzIHRoYXQgd2VyZSBuZXZlciBpbXBsZW1lbnRlZC4gSSdkIGxpa2Ug
dG8KcmVtb3ZlIHRoZXNlIHZhcmlhYmxlcyBpZiB0aGVyZSBhcmUgbm8gcGxhbnMgbW92aW5nIGZv
cndhcmQgdG8KaW1wbGVtZW50IHRoZW0uIE90aGVyd2lzZSBJJ2xsIGp1c3QgbGVhdmUgdGhlbS4K
Cmh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGludXgvbGludXgvaXNzdWVzLzUyOAoKVGhh
bmtzLApOYXRoYW4gSHVja2xlYmVycnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZnJlZWRyZW5v
