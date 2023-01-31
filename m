Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEF76829E7
	for <lists+freedreno@lfdr.de>; Tue, 31 Jan 2023 11:06:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C80F10E14E;
	Tue, 31 Jan 2023 10:06:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB4610E14E;
 Tue, 31 Jan 2023 10:06:51 +0000 (UTC)
Date: Tue, 31 Jan 2023 10:06:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1675159608; x=1675418808;
 bh=PKjpB873KFVEKBlEethlWB5JT7+2UnaIsAv0b3E2kIs=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=wsuOR3mX603RNEeWhABWWFmL2nbJYBaLdk8yrFbaio/m0XrH/Sy/Kt6xgSjDJSeV5
 GP7z7pl1OWG1AXhl9IBrPmjfBsK4QyElr+Me+wOu3Jl4WY7Ye6XIcECf+A6lSSYPQm
 ckdzRe3aK3Q+Ehk7D/XtwcrVqP5S75ZlCG+G3x4AmeFAXROjgCIRdHHywO+h4NOASu
 XK+5QRcX/wVTHAtlZSe3tKrzyae5weCO+FNRz5uWBY3o8MkyFw25gpX/Do6fm+bx0F
 K6fEcLUjTsEpPAiQo0ZDvpRtxNhvZDBKvbbLeqc31PG6rNGZl8Otf77HuWUkNoDVVk
 j7H6oOD6Fi51A==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <9Q0ano1jjZ1LTNWaVcVkDp0-jsTSUJKoNrKwvpGpIuejUSB33DK-uOpeLmyMbbk6tdfWG8RS83AGyB--EPEHqJe5shq6RC_gVpPLR7sUScY=@emersion.fr>
In-Reply-To: <20230131112527.32ab8ba5@eldfell>
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <Y7a1hCmsvJHKdW1Y@phenom.ffwll.local>
 <58caf08c-3a02-82ce-4452-8ae7f22f373d@quicinc.com>
 <CAA8EJppnAmN6+S-emEfXJEc1iVf+DjeLBmCQpGd-nRY2M2AAQQ@mail.gmail.com>
 <Y7hrWDpg8msuefgZ@phenom.ffwll.local>
 <CAA8EJppoejPPNhu3eHBc_vsstHvEEwYx67HZLo8+4W3K-gHkag@mail.gmail.com>
 <20230131112527.32ab8ba5@eldfell>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [RFC PATCH v3 0/3] Support for Solid Fill Planes
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
Cc: sebastian.wick@redhat.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, robdclark@gmail.com, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, Daniel Vetter <daniel@ffwll.ch>,
 daniel.vetter@ffwll.ch, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, ville.syrjala@linux.intel.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tuesday, January 31st, 2023 at 10:25, Pekka Paalanen <ppaalanen@gmail.co=
m> wrote:

> indeed, what about simply using a 1x1 framebuffer for real? Why was that
> approach rejected?

Ideally we don't want to allocate any GPU memory for the solid-fill
stuff. And if we special-case 1x1 FB creation to not be backed by real
GPU memory then we hit several situations where user-space expects a
real FB but there isn't: for instance, GETFB2 converts from FB object
ID to GEM handles. Even if we make GETFB2 fail and accept that this
breaks user-space, then there is no way for user-space to recover the
FB color for flicker-free transitions and such.

This is all purely from a uAPI PoV, completely ignoring the potential
issues with the internal kernel abstractions which might not be suitable
for this either.
