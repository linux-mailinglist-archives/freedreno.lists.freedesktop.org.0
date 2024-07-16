Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8706E94BDBC
	for <lists+freedreno@lfdr.de>; Thu,  8 Aug 2024 14:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3816B10E713;
	Thu,  8 Aug 2024 12:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSViBfMF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209C010E061
 for <freedreno@lists.freedesktop.org>; Tue, 16 Jul 2024 23:51:25 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id
 2adb3069b0e04-52ea5dc3c79so8638864e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 16 Jul 2024 16:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721173882; x=1721778682; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JzrPpzPnZJFkh7jVlIrHOteriieRGETGVO91ysieZS8=;
 b=BSViBfMFEWXzouZe4AMlS6nsIpR2ioXIRl7jYzLXGUfN1AQBj5GIMU6MEzo1viva6O
 XnA/+CqqvOP7iybsEYjrSSUj0jaLB/VOiTrlwKkBclQXAfSDST7lAJpZRdpulDQFTqd2
 CBEtTRgnvaA5P1nhLUXuaugpXLgojx9NyCr6VJKE16Q59YdB8DcAan8ZNBUh7C/q4tHY
 fYmms1m6zs5Xzt0odCvSk9iX+fBjtzURtqaPOPeHLaLyoEQCZIohS5Bb2SbVEBMLFT2i
 oM662ZR+X26H2XkfuGrEWd525P1nrhrxqDftpmzwWXhw0+Np1UBnPIJapwWFyeSgqn3J
 NNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721173882; x=1721778682;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JzrPpzPnZJFkh7jVlIrHOteriieRGETGVO91ysieZS8=;
 b=AWUwx3V5+rWeFET2Fft07Hp0Ctx8WWkuCJz8ToVC4QIPsA3HHyfAO5A+ViocRbGyvA
 h81V8gq32SzwTCvtQlcDHtAmPij2w2jzA8JSkUYZfriTo8b9vnhejbt8oUamkhxYer0k
 nnNsQ9vVFD9v0w5Y9gisfG5mcswq+RWNX2Vm3sFKCxlGCvkV3V8bHBpDWdYyPCHEZPqt
 IQRfDuSYyBPCzut6MGn/vMfA4mZn8t6+/ncR0a14sOXUkjjukYxE56+vU/JqFJV7c5Wl
 uFoO/VA7eOMKvu0BINd/4CS0bERMhj2e9IoxoJppuP8uVnEC89vjL7FdGFr1ae0I2bm0
 sQpA==
X-Gm-Message-State: AOJu0YynfYj5L+1q6ejB9St4v+1zudqjJWprPfqFNx1TONaQoTCoLa4X
 LQHZLGOWfEY+FZPzkutKJKEAaYOnRnWtN6hJazPEw5ZR2t3dSmOAcNdLGd0ko1X9B95/dZGdC4R
 7jEIzQzmtvzQO/lC4ddjkKg08kBeChx2e
X-Google-Smtp-Source: AGHT+IGPIEruWWOWLCN69ciqS6MWVSnMKrG+j6MBYjcqEJaPoDMFzWhZiNpKg9Dha5KgxnBYG3v47bABRNZcdgVoowc=
X-Received: by 2002:a05:6512:e9c:b0:52b:c27c:ea1f with SMTP id
 2adb3069b0e04-52edf0345b8mr2806921e87.55.1721173882184; Tue, 16 Jul 2024
 16:51:22 -0700 (PDT)
MIME-Version: 1.0
From: Mady Bagaya <madybagaya2@gmail.com>
Date: Tue, 16 Jul 2024 23:51:08 +0000
Message-ID: <CAKKayFpbLokdPZKtRdywOgZ0SHO-cFZS7O01exgDi0NrFOpqKQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 07/13] drm/mediatek: Provide ddc symlink in
 hdmi connector sysfs directory
To: freedreno@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000d82e81061d66050f"
X-Mailman-Approved-At: Thu, 08 Aug 2024 12:42:47 +0000
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

--000000000000d82e81061d66050f
Content-Type: text/plain; charset="UTF-8"



--000000000000d82e81061d66050f
Content-Type: text/html; charset="UTF-8"

<div dir="auto"></div>

--000000000000d82e81061d66050f--
