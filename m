Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A060874ABE1
	for <lists+freedreno@lfdr.de>; Fri,  7 Jul 2023 09:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B61E10E516;
	Fri,  7 Jul 2023 07:26:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D560310E516;
 Fri,  7 Jul 2023 07:26:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6028E617AF;
 Fri,  7 Jul 2023 07:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC04C433C8;
 Fri,  7 Jul 2023 07:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688714803;
 bh=756LPQWTOqhhx/zIkUsbRPWNm3vIwenx+BIkIwgR+V8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=W2LDACi9a3ojrZb4wRB2voA1UT5ATTdQqNjAwnHcXn5UUnY1ik4uNGrHuiWipKMN+
 bbhEWxtC7ANaVFE2N3jxjonv0hSZcBkA4dpFlNuwbWHmW2vrfTFelhoqwIj0oyjyEa
 ayfys8XJehCQ9qQfO8ILD3Bqryp1E4qPNxRIWc+3ljgwNnEfCLqX1rpKyzPkutpATC
 wOpU7mjYJqvLB0C3vNiH83Biln1PqegoNR3+0FMEi/Boy+JAREsifpNaAEqogB+cOo
 6i7AGnbnQhQor/9TA1cHvSLxsGHEhRXJqyKQHz++B2ya8YTd2aHVMCYTZnlZPzcHha
 p+KwTjsvs7DLA==
Message-ID: <3bbcabc4-69d2-93e0-a3e6-60d575b40126@kernel.org>
Date: Fri, 7 Jul 2023 09:26:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-12-robdclark@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230706211045.204925-12-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 11/12] dt-bindings: drm/msm/gpu: Extend
 bindings for chip-id
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 06/07/2023 23:10, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Upcoming GPUs use an opaque chip-id for identifying the GPU.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC. It might happen, that command when run on an older
kernel, gives you outdated entries. Therefore please be sure you base
your patches on recent Linux kernel.

You missed at least DT list (maybe more), so this won't be tested by
automated tooling. Performing review on untested code might be a waste
of time, thus I will skip this patch entirely till you follow the
process allowing the patch to be tested.

Please kindly resend and include all necessary To/Cc entries.

Best regards,
Krzysztof

