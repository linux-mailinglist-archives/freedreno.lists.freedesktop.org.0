Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E461253C0F7
	for <lists+freedreno@lfdr.de>; Fri,  3 Jun 2022 00:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85FE71139DB;
	Thu,  2 Jun 2022 22:47:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E9A113B47
 for <freedreno@lists.freedesktop.org>; Thu,  2 Jun 2022 22:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654210054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qM7RSO4/tzFo13g+8+xYBdsTDduUl6xGQcpX/+XbDM4=;
 b=C8VY3sfgf+QqFzTfAWSlevr4HxHruEzDT8FkhnBGW8S75FRcf3Z2zrkES/pzpxUKJyxKJT
 y438dYmOaS2aP11dg1Xt+SOB7sue5sS1GBIu53YQzIF+7h2tVolfnKIOl6B4/NLzgXc6b5
 6w8Qtxg7K+l63hj9WyNRpwI7yAF6m90=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-MCGfzEwENaetSog7zxneiA-1; Thu, 02 Jun 2022 18:47:32 -0400
X-MC-Unique: MCGfzEwENaetSog7zxneiA-1
Received: by mail-qv1-f72.google.com with SMTP id
 fw9-20020a056214238900b0043522aa5b81so4259802qvb.21
 for <freedreno@lists.freedesktop.org>; Thu, 02 Jun 2022 15:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=qM7RSO4/tzFo13g+8+xYBdsTDduUl6xGQcpX/+XbDM4=;
 b=MwL6qOFh31tL9wqBtS84If/zO7psFPg2f9EMsofF3nDF1U2ikepWspeqCDiGp085aC
 LtQnZ4Le8xop6ZqkfS8DPMR4Wrol39DYvBzRFhiMFGswUHNyVvgDxpV9JxqD47WyGeg9
 IS6NM8igrSkJVUYlgmRZ1Rf98r7yay1qcKckuz+qk37diyMw+3Vn1sg2gA7jDfRDXJc3
 BuEuf3CsXEw+NsL0VaAK/tqdXT1wCEZ+hXWZncpr/URgnDYD08pAt4tFMIHOL/y3gS06
 MugR0rNJoxqz65c8wjXCTK+VwL1OMz91nEtAsLMu1tfyC7htD+unX5HYYZTz0q1+ZEO6
 i+1g==
X-Gm-Message-State: AOAM530xM8s3tQhXK+WRKTu1F6rILGFnwduknIZSMCAWGiosagLcF235
 YMOULE/4mJI6Bt2GuPHPNHmGA5st2wnwtvobVuyiuKGyiq+M8oCz6MIP0LzbgKrsidxY626xqRD
 UZZkvq2Lj+j082sOWmDSAudu193Qf
X-Received: by 2002:a05:620a:25cb:b0:6a1:136:a7ed with SMTP id
 y11-20020a05620a25cb00b006a10136a7edmr4702916qko.531.1654210052043; 
 Thu, 02 Jun 2022 15:47:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpnm1UyzEEBtWAnuoHs5dkbiAxvr8+KtajlKCD6hPVaJaiWLzEVDhYIlzllPONobjHXa8Z3g==
X-Received: by 2002:a05:620a:25cb:b0:6a1:136:a7ed with SMTP id
 y11-20020a05620a25cb00b006a10136a7edmr4702907qko.531.1654210051816; 
 Thu, 02 Jun 2022 15:47:31 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 f6-20020a05622a104600b002f39b99f6a3sm4086110qte.61.2022.06.02.15.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 15:47:31 -0700 (PDT)
Message-ID: <d717d5e385e0f64e0168695ea2f693ec9db2e28a.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: events@lists.x.org, xorg-devel@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 libre-soc-dev@lists.libre-soc.org
Date: Thu, 02 Jun 2022 18:47:29 -0400
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] XDC 2022: Registration & Call for Presentations still
 open!
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

Hello! This is just a reminder that the CFP for XDC in 2022 is still open!

The 2022 X.Org Developers Conference is being held in conjunction with
the 2022 Wine Developers Conference.  This is a meeting to bring
together developers working on all things open graphics (Linux kernel,
Mesa, DRM, Wayland, X11, etc.) as well as developers for the Wine
Project, a key consumer of open graphics.

Registration & Call for Proposals are now open for both XDC 2022 and
WineConf 2022, which will take place on October 4-6, 2022 in
Minneapolis, Minnesota, USA. 

https://xdc2022.x.org
 
As usual, the conference is free of charge and open to the general
public. If you plan on attending, please make sure to register as early
as possible!
 
In order to register as attendee, you will therefore need to do it via
the XDC website:
 
https://indico.freedesktop.org/event/2/registrations/2/
 
In addition to registration, the CfP is now open for talks, workshops
and demos at XDC 2022. While any serious proposal will be gratefully
considered, topics of interest to X.Org and freedesktop.org developers
are encouraged. The program focus is on new development, ongoing
challenges and anything else that will spark discussions among
attendees in the hallway track.
 
We are open to talks across all layers of the graphics stack, from the
kernel to desktop environments / graphical applications and about how
to make things better for the developers who build them. Head to the
CfP page to learn more: 
 
https://indico.freedesktop.org/event/2/abstracts/
 
The deadline for submissions is Monday July 4th, 2022.
 
Check out our Reimbursement Policy to accept speaker
expenses for X.Org events like XDC 2022:
 
https://www.x.org/wiki/XorgFoundation/Policies/Reimbursement/

If you have any questions, please send me an email to
xdc@codeweavers.com, adding on CC the X.org board (board
at foundation.x.org).
 
And don't forget, you can follow us on Twitter for all the latest
updates and to stay connected:
 
https://twitter.com/XOrgDevConf

Best regards,
Lyude Paul, on behalf of X.org

