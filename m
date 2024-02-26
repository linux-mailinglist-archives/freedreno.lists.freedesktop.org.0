Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CF1867505
	for <lists+freedreno@lfdr.de>; Mon, 26 Feb 2024 13:32:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D2410F148;
	Mon, 26 Feb 2024 12:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="FKZUlHBf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1514C10F146
 for <freedreno@lists.freedesktop.org>; Mon, 26 Feb 2024 12:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=naPjzZspUJvzWT+GJjwqLixXs8B0ZAsekA6k8xvkWCk=;
 t=1708950774; x=1709382774; b=FKZUlHBfGdpiwdJYdHYTR8IC5UZ46ZEEMGmmajfrXQ60WUg
 WVfVDkE4oDVi6E1ZVTAIqBcGOtzwu46E3dKG1Ze4T79pzcRMWuGA/5D6cDNCeq9ay+sl960V7Qped
 4N3aK5EKhKXEfa8tlltFJ4134lE+e56fSjuU+oZu8a8Mv0jwHVEfivk8A/nad6gNytuqx3miwbzEL
 MLdTJ8J73XC6AqALlGK/uOM0gntkgfgxNVIkBIEqi1gArIjkdmYhv8iGC7GxgGFoI+3x95yT5fH1N
 tyzWkKlzhNtb9Ktck5VjRJ8nhcMass313WqGgcmUif0in1rtFrwOHV6ZXzTv987Q==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1reaA7-0004cs-Fb; Mon, 26 Feb 2024 13:32:51 +0100
Message-ID: <a037cb7d-426e-4cd0-9ebb-f299aa48dcf1@leemhuis.info>
Date: Mon, 26 Feb 2024 13:32:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] sc7180-trogdor-lazor image corruption regression for
 USB-C DP Alt Mode ([PATCH 0/2] Add param for the highest bank bit)
To: regressions@lists.linux.dev
Cc: freedreno@lists.freedesktop.org
References: <20231207213048.1377147-1-cwabbott0@gmail.com>
 <85581fad-da8f-4550-a1c8-8f2996425dcd@lausen.nl>
 <CAA8EJpoqS856N8w3ZxdhQ0TUVP2u5K8qCjG=qLQPnHXGH9NyNg@mail.gmail.com>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <CAA8EJpoqS856N8w3ZxdhQ0TUVP2u5K8qCjG=qLQPnHXGH9NyNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1708950774;
 309fa72d; 
X-HE-SMSGID: 1reaA7-0004cs-Fb
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 18.02.24 14:31, Dmitry Baryshkov wrote:
> On Sun, 18 Feb 2024 at 03:17, Leonard Lausen <leonard@lausen.nl> wrote:
>>
>> Hi Connor,
>>
>> unfortunately, your series https://patchwork.freedesktop.org/series/127529/ has introduced a regression for external displays connected through USB-C DP Alt Mode, at least on sc7180-trogdor-lazor devices. Do you think it's possible to  fix this before the 6.8 release or would it be better to revert the series? I'm happy to help testing any fixes. The issue is also tracked at https://gitlab.freedesktop.org/drm/msm/-/issues/49.
>>
>> Thank you
>> Leonard
>>
>> #regzbot introduced: 8814455a0e54ca353b4b0ad5105569d3fdb945cc
> 
> #regzbot monitor https://gitlab.freedesktop.org/drm/msm/-/issues/49

This is a duplicate, thus handle it as such:

#regzbot duplicate https://gitlab.freedesktop.org/drm/msm/-/issues/49
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


